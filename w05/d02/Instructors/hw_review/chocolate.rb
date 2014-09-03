def make_chocolate(small_bars_given, big_bars_given, goal_weight)

  big_bars_needed = goal_weight / 5

  # do we have enough big bars for the need? How many should we use?

  if big_bars_given <= big_bars_needed
    big_bars_used = big_bars_given
  else
    big_bars_used = big_bars_needed
  end

  small_bars_needed = goal_weight - (big_bars_used * 5)

  if small_bars_needed > small_bars_given
    return -1
  else
    small_bars_used = small_bars_needed
    return small_bars_used
  end
end

def assert(actual, expected)
  unless actual == expected
    throw "Expected #{expected}, but was #{actual}"
  end
end

assert(make_chocolate(2,2,13), -1)
assert(make_chocolate(3,2,13), 3)
assert(make_chocolate(3,3,13), 3)
assert(make_chocolate(10,1,13), 8)
assert(make_chocolate(0,2,10), 0)
puts "All tests sucessfully run!"