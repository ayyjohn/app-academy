def exp(base, power)
  return 1 if power == 0
  return base if power == 1

  half = exp(base, power / 2)
  if power.even?
    half * half
  else
    base * half * half
  end
end
