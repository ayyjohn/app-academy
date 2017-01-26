def subsets(array)
  # returns an array of arrays, each representing a subset of the
  # current array. The subset of [] is [], and the subset of [n]
  # is [[],[n]].

  subset_list = []
  return subset_list << [] if array == []
  # the methodology here is that for each value in an array (I chose
  # the last value) there exists a two different types of subsets,
  # those that include the last value, and those that don't
  # the difference between the two is what allows us to recursively do
  # the calculation. The subsets that do not include the value
  # is equal to the subsets of the rest of the array without the value
  # and the two can be linked by injecting the value into each one of
  # those subset values. This is done recursively below.
  smaller_subset = subsets(array.slice(0..-2))
  smaller_subset + smaller_subset.map { |set| set + [array.last] }
end
