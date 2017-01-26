def make_change(target, coins = [25, 10, 5, 1])
  # given the default american coins system (excluding 50 cent piece)
  # returns the fewest amount of coins to produce the target value

  # you can't make change for nothing
  return [] if target == 0

  # you can't make change for a target value unless you have a
  # coin less than that value
  return nil if coins.none? { |coin| coin <= target }

  coins = coins.sort.reverse

  # keep a running best_change so far value; this will be updated
  # if any later path of coins is shorter
  best_change = nil

  # create every combination of coins possible without
  # counting a permutation of an old combination as a new
  # combination, and check to see whether it's a better
  # way to make change than best_change
  coins.each_with_index do |coin, index|
    next if coin > target

    remainder = target - coin

    best_remainder = make_change(remainder, coins.drop(index))

    next if best_remainder.nil?

    this_change = [coin] + best_remainder

    if best_change.nil? || (this_change.count < best_change.count)
      best_change = this_change
    end

  end

  best_change
end
