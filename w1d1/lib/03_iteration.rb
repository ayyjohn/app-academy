def factors(num)
  factors = []

  (1..num**(0.5)).each do |factor|
    if (num % factor).zero?
      factors << factor
      factors << num/factor
    end
  end

  factors.sort
end

def substrings(string)
  substrings = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      substrings << string[i..j]
    end
  end
  substrings
end

def subwords(word, dictionary)
  actual_words = []
  substrings(word).each do |possible_word|
    actual_words << possible_word if dictionary.include?(possible_word)
  end
  actual_words.uniq
end

def doubler(array)
  array.map { |i| i * 2 }
end

class Array
  def bubble_sort!(&prc)
    sorted = false

    until sorted
      sorted = true

      if prc.nil?
        self.each_index do |i|
          next if i+1 == self.length
          j = i+1
          if self[i] > self[j]
            self[i], self[j] = self[j], self[i]
            sorted = false
          end
        end
      else
        self.each_index do |i|
          next if i+1 == self.length
          j = i+1
          if prc.call(self[i], self[j]) == 1
            self[i], self[j] = self[j], self[i]
            sorted = false
          end
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!()
  end

  def my_inject(initial_value = self.first, &prc)
    self.drop(1).each do |value|
      initial_value = prc.call(initial_value, value)
    end
    initial_value
  end


end

def concatenate(strings)
  strings.inject("") { |acc, string| acc + string }
end
