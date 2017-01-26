def binary_search(arr, search_val)
  # returns the value of the index of search_val in an array
  # if it is found, or nil if not, using an implimentation of
  # recursive binary search (ie divide the array in half and only
  # search the portion that could possibly contain the array).
  # note that the array must be sorted for this to work.

  middle = arr.length / 2
  midval = arr[middle]
  return middle if midval == search_val
  # since the function call is recursive, we have to handle
  # the case where the search returns nil all the way back up
  # the stack. This is handled by the ternary operator on line 17
  # where middle is only added in the case that the value was found
  # otherwise nil gets returned the whole way up
  return nil if arr.length == 1
  if search_val > midval
    smaller_search = binary_search(arr.slice(middle..-1), search_val)
    (smaller_search.nil? ? nil : smaller_search + middle)
  else
    binary_search(arr.slice(0...middle), search_val)
  end
end
