def permutations(array)

  return [array] if array.length == 1

  perm_arr = []
  array.each_with_index do |pivot, index|
    sliced_arr = array.slice(0...index) + array.slice(index + 1..-1)
    perm_arr += permutations(sliced_arr).map do |arr|
      arr.unshift(pivot)
    end
  end
  perm_arr
end
