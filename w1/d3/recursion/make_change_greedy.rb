def make_change_greedy(amount, coins)
  # returns an array of coins needed to make change for the amount.
  # calculates this value greedily, ie takes the largest coin
  # possible at each attempt; this guarantees a solution
  # but does not guarantee the least amount of coins given back

  return [] if amount == 0
  coin_arr = []

  coins.each do |coin|
    if coin <= amount
      coin_arr += [coin]
      break
    end
  end
  coin_arr + make_change_greedy(amount - coin_arr.last, coins)
end
