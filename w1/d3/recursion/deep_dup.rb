class Array
  
  def deep_dup(new_arr = [])
    # return a duplicate array where the references to each
    # array in the array are also different; therefore
    # for any level of depth, no matter whether or not the
    # contents are mutable, there won't be a link between
    # the original array and the duped array

    self.each do |el|
      return new_arr << el.dup unless el.is_a?(Array)
      new_arr << el.deep_dup
    end
  end

  def deep_dup_inj
    # one line deep dup with inject

    inject([]) { |dup, el| dup << (el.is_a?(Array) ? el.deep_dup_inj : el.dup) }
  end

  def deep_dup_map
    # one line deep dup with map

    map { |el| el.is_a?(Array) ? el.deep_dup_map : el.dup }
  end
end
