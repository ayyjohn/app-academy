class Array

  def my_each(&prc)

    i=0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end

  def my_select(&prc)
    keep = []
    self.my_each do |el|
      keep << el if prc.call(el)
    end
    keep
  end

  def my_reject(&prc)
    keep = []
    self.my_each do |el|
      keep << el if !prc.call(el)
    end
    keep
  end

  def my_any(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_flatten(flattened_array = [])
    self.inject(flattened_array) do |array, item|
      p array, item
      if item.is_a?(Integer)
        flattened_array << item
      else
        item.my_flatten(flattened_array)
      end
    end
    flattened_array
  end

  def my_rotate(num_times = 1)
    self_duped = self.dup
    if num_times > 0
      num_times.times do |el|
        self_duped << self_duped.shift
       end
    else
      (-num_times).times { self_duped.unshift(self_duped.pop) }
    end
    self_duped
  end

  def my_zip(*args)
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
    dupe = self.dup
    half = dupe.length / 2
    dupe[0..half].each_with_index do |element, index|
      dupe[index], dupe[-1-index] = dupe[-1-index], dupe[index] 
    end
    dupe
  end

end
