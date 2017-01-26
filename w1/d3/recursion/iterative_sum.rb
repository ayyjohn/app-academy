def iterative_sum(arr)
  # computes the sum of an array iteratively

  sum = 0
  arr.each { |num| sum += num }
  sum
end
