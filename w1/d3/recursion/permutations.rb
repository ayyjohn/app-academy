def permutations(array)
  # returns an array containing every possible
  # perumtation of an array of values in which all the values are
  # included (ie this is a representation of how many ways can we
  # choose n from n, not an n choose k scenario)

  return [array] if array.length == 1

  perm_arr = []
  # the algorithm followed below is explained as such;
  # for each element in the array, slice the array such that
  # it doesn't include that value anymore. Next, find the permutations
  # of the array without the element, and for each of those
  # add the element (here referred to as pivot) to the beginning.
  # since each element gets a chance to be first, this means
  # that we will find every permutation.
  array.each_with_index do |pivot, index|
    sliced_arr = array.slice(0...index) + array.slice(index + 1..-1)
    perm_arr += permutations(sliced_arr).map do |arr|
      arr.unshift(pivot)
    end
  end
  perm_arr
end
