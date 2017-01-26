class Array
  def deep_dup(new_arr = [])

    self.each do |el|
      return new_arr << el.dup unless el.is_a?(Array)
      new_arr << el.deep_dup
    end
  end
end
