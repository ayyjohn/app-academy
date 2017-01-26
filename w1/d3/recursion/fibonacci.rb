def fib(n)
  # returns an array with the first n fibonacci numbers
  # calculated recursively
  # by convention the sequence will here start with 1 and 1

  return [1] if n == 1
  return [1, 1] if n == 2
  prev = fib(n - 1)
  prev << (prev[-1] + prev[-2])
end
