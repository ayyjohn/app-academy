def recursive_sum(arr)
  # computes the sum of an array recursively

  # the base case for a sum is that there is no need to add
  # if the array is one element long
  return arr.first if arr.length == 1
  # by calling recursive sum on everything
  # but the first element we eventually get
  # down to the last element, which is then
  # a lone element, and begins unwinding the recursive call
  arr.first + recursive_sum(arr[1..-1])
end
