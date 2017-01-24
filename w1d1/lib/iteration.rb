def factors(num)
  # returns an array of the factors of a number

  factors = []

  (1..num**0.5).each do |factor|
    if (num % factor).zero?
      factors << factor
      factors << num / factor
    end
  end

  factors.sort
end

def substrings(string)
  # helper method. returns an array with all substrings
  # in a string that retain the original order.

  substrings = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      substrings << string[i..j]
    end
  end
  substrings
end

def subwords(word, dictionary)
  # takes an input of a dictionary, returns an array of all the words
  # that the main word contains that retain the original order

  actual_words = []
  substrings(word).each do |possible_word|
    actual_words << possible_word if dictionary.include?(possible_word)
  end
  actual_words.uniq
end

def doubler(array)
  # returns an array of numbers with all elements doubled

  array.map { |i| i * 2 }
end

class Array
  def bubble_sort!(&prc)
    # sorts an array using the bubble sort method. Takes a block
    # if supplied, otherwise sorts in ascending order.

    sorted = false

    until sorted
      sorted = true

      if prc.nil?
        self.each_index do |i|
          next if i + 1 == self.length
          j = i + 1
          if self[i] > self[j]
            self[i], self[j] = self[j], self[i]
            sorted = false
          end
        end
      else
        self.each_index do |i|
          next if i + 1 == self.length
          j = i + 1
          if prc.call(self[i], self[j]) == 1
            self[i], self[j] = self[j], self[i]
            sorted = false
          end
        end
      end
    end
    self
  end

  def bubble_sort
    # a non-dangerous version of bubble sort; doesn't modify the
    # original array

    self.dup.bubble_sort!
  end

  def my_inject(initial_value = self.first, &prc)
    # copies the Array#inject method.
    # takes a starting value and then applies the proc to each
    # value in the array, adding it to the starting value

    self.drop(1).each do |value|
      initial_value = prc.call(initial_value, value)
    end
    initial_value
  end


end

def concatenate(strings)
  # takes an array of strings and returns
  # a string of them together without spaces between
  
  strings.inject("") { |acc, string| acc + string }
end
