def recursive_sum(arr)

  return arr.first if arr.length == 1
  arr.first + recursive_sum(arr[1..-1])
end
