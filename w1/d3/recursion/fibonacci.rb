def fib(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  prev = fib(n - 1)
  prev << (prev[-1] + prev[-2])
end
