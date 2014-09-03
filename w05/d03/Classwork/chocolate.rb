def make_chocolate (small, big, goal_weight)
	if big * 5 > goal_weight
	number_big_bars_used = goal_weight/5
	number_small_bars_used = goal_weight - (number_big_bars_used * 5)

	elsif (big * 5) < goal_weight
	weight_big_bars_used = (big * 5) 
	weight_small_bars_used = goal_weight - weight_big_bars_used

end
	else 
		number_big_bars_used = goal_weight/5
		number_small_bars_used = goal_weight - (number_big_bars_used * 5)
		number_small_bars_used  small || number_big_bars_used > big
		return -1

	else


def assert(actual, expected)
  unless actual == expected
    throw "Expected #{expected}, but was #{actual}"
  end
end

assert(make_chocolate(2,2,13), -1)
assert(make_chocolate(3,2,13), 3)
assert(make_chocolate(3,3,13), 3)
assert(make_chocolate(10,1,13), 8)