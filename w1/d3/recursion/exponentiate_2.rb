def exp(base, power)
  return 1 if power == 0
  return base if power == 1
  if power.even?
    value = exp(base, power / 2)
    p power
    value * value
  else
    value = exp(base, (power - 1) / 2)
    p power
    base * value * value
  end
end
