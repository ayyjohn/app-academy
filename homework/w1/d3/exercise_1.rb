def sum_to(n)
  return nil if n < 0
  return 0 if n == 0
  n + sum_to(n - 1)
end
