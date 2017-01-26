def range(start, finish)
  # copies a call to (x...y).to_a
  
  return [] if start >= finish
  [start] + range(start + 1, finish)
end
