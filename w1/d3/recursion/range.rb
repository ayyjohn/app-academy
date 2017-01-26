def range(start, finish)
  return [] if start == finish
  [start] + range(start + 1, finish)
end
