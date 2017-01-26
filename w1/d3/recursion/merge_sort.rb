def merge_sort(array)
  # returns a sorted array by implementing the merge sort
  # algorithm recursively.
  
  return array if array.length <= 1
  middle = array.length / 2
  left = array.take(middle)
  right = array.drop(middle)
  merge(merge_sort(left), merge_sort(right))
end

def merge(array1, array2)
  # helper method for merge_sort
  # returns two arrays merged in sorted order
  # by iterating through both until one is empty, adding the
  # first element of whichever array starts with a smaller element

  # optimization: if one array is empty, add the rest of the array
  # to the merged array in one function call
  merged = []
  until array1.empty? || array2.empty?
    if array1.first < array2.first
      merged << array1.shift
    else
      merged << array2.shift
    end
  end
  merged + array1 + array2
end
