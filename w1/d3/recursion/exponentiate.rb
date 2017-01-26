def exp(base, power)
  # returns the value of base raised to the exponent
  # calculated recursively

  # any number to the zero power is one
  return 1 if power == 0
  base * exp(base, power - 1)
end
