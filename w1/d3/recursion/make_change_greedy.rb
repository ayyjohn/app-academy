def make_change_greedy(amount, coins)

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
