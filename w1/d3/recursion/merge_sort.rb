def merge_sort(array)

  return array if array.length <= 1
  middle = array.length / 2
  left = array.slice(0...middle)
  right = array.slice(middle..-1)
  merge(merge_sort(left), merge_sort(right))
end

def merge(array1, array2)
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
