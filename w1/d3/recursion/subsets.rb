def subsets(array)
  subset_list = []
  return subset_list << [] if array == []
  smaller_subset = subsets(array.slice(0..-2))
  smaller_subset + smaller_subset.map { |set| set + [array.last] }
end
