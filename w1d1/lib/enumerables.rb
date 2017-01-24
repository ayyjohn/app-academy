class Array

  def my_each(&prc)
    # copy the Array#each method
    # returns the original array, but applies the given
    # block to each element

    i = 0

    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end

  def my_select(&prc)
    # copy the Array#select method
    # returns a new array with only the elements for which the
    # given block returned true

    keep = []

    self.my_each do |el|
      keep << el if prc.call(el)
    end
    keep
  end

  def my_reject(&prc)
    # copy the Array#reject method
    # returns a new array with only the elemnts for which the given
    # block returned false

    keep = []

    self.my_each do |el|
      keep << el if !prc.call(el)
    end
    keep
  end

  def my_any(&prc)
    # copy the Array#any method
    # returns true if any of the elements in the array returned
    # true from the block given

    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all(&prc)
    # copy the Array#all method
    # returns true if the given block returns true for all
    # elements in the array

    self.my_each do |item|
      return false unless prc.call(item)
    end

    true
  end

  def my_flatten(flattened_array = [])
    # copy the Array#flatten method
    # takes an array of arrays and recursively returns
    # an array with all of the elements in one array

    self.inject(flattened_array) do |array, item|
      if item.is_a?(Integer)
        flattened_array << item
      else
        # if the item isn't a int, it's an array which needs to be flat
        item.my_flatten(flattened_array)
      end
    end
    flattened_array
  end

  def my_rotate(positions = 1)
    # rotates elements from front to back or back to front in a
    # one dimensional array. If positive, elements move
    # from right to left, if negative elements move from right to left.
    # note the connection using modulo. For a negative number, instead
    # of shifting opposite directions (IE negative shifts right and
    # positive shifts left), the modulo operator allows us to
    # differentiate between left and right because -3 % 4 == 1 and
    # 3 % 4 == 3. shifting is cyclical; so any number of shifts mod 4
    # equals any other number of shifts that has the same divisibility
    # by four remainder.
    
    array = self.dup
    moves = positions % self.length

    moves.times { array << array.shift }
    array
  end

  def my_zip(*args)
    # takes multiple arrays and converts them into an array
    # of arrays where all the elements in each array at the same
    # position are in the same array
    # eg [1,2,3].zip([4,5,6][7,8,9]) #=> [[1,4,7],[2,5,8],[3,6,9]]

    zipped = Array.new (self.length) { [] }

    self.length.times do |i|
      zipped[i] << self[i]
      args.each do |arg|
        zipped[i] << arg[i]
      end
    end
    zipped
  end


  def my_join(delimiter = "")
    # takes an array and returns a string of the elements joined by the
    # delimiter value

    string = ""

    self.my_each do |char|
      string += char + delimiter
    end
    if delimiter == ""
      string
    else
      string[0...-1]
    end
  end

  def my_reverse
    # takes an array and returns the array with the elements in
    # reverse order.

    dupe = self.dup
    half = dupe.length / 2
    dupe[0..half].each_index do |index|
      dupe[index], dupe[-1 - index] = dupe[-1 - index], dupe[index]
    end
    dupe
  end

end
