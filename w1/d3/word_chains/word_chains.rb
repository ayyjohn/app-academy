require 'set'

class WordChainer
  attr_reader :dictionary

  def initialize(dictionary_file)
    @dictionary = File.readlines(dictionary_file).map(&:chomp)
    @dictionary = Set.new(@dictionary)
  end

  def run(source, target)
    # returns an array of words starting with source and ending with
    # target in which each value between only differs by one letter
    
    @current_words, @all_seen_words = [source], { source => nil }

    until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words
    end

    build_path(target)
  end

  def adjacent_words(word)
    # returns an array of words that differ from word by one letter

    adjacent_words = []

    word.each_char.with_index do |old_letter, i|
      ('a'..'z').each do |new_letter|

        next if old_letter == new_letter

        new_word = word.dup
        new_word[i] = new_letter

        # we don't need to add words like oool from cool
        adjacent_words << new_word if dictionary.include?(new_word)

      end
    end
    adjacent_words
  end

  def explore_current_words
    # for each adjacent word add a key to the @all_seen_words hash
    # with a value pointing to the word that it was branched from
    # then set @current_words equal to new_current_words so that
    # when this process is run, first it finds all adjacent words
    # to the source word, then it finds all adjacent words to those
    # words and so on, with each layer pointing back to the one that
    # it came from.

    new_current_words = []

    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|

        # no need for repeats
        next if @all_seen_words.key?(adjacent_word)

        new_current_words << adjacent_word
        @all_seen_words[adjacent_word] = current_word
      end
    end

    @current_words = new_current_words
  end

  def build_path(target)
    # return a path from target to the original word by starting at the
    # target and tracing back through the @all_seen_words hash which
    # each value is a pointer to the word that the key stemmed from.
    # this will end when we get to the first word since it points to nil
    # since it didn't stem from any other word.

    path = []
    current_word = target

    until current_word.nil?
      path << current_word
      current_word = @all_seen_words[current_word]
    end
    # maintain forward time illusion
    path.reverse
  end

end

if __FILE__ == $PROGRAM_NAME
  p WordChainer.new(ARGV.shift).run("duck", "ruby")
end
