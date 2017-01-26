def binary_search(arr, search_val)

  middle = arr.length / 2
  midval = arr[middle]

  return middle if midval == search_val
  if search_val > midval
    middle + binary_search(arr.slice(middle..-1), search_val)
  else
    binary_search(arr.slice(0...middle), search_val)
  end
end
