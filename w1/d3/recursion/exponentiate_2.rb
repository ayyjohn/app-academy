def exp(base, power)
  # returns the value of base raised to the power
  # implements a better than strictly recursive algorithm
  # since we half the exponent every time
  # and use the fact that a number times itself is equivalent
  # to squaring it.
  
  return 1 if power == 0
  return base if power == 1

  half = exp(base, power / 2)

  if power.even?
    half * half
  else
    base * half * half
  end
end
