def exp(base, power)

  return 1 if power == 0
  base * exp(base, power - 1)
end
