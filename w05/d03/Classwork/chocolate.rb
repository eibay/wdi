def make_chocolate(small_bars_given, big_bars_given, goal_weight)
  # big_bars_used = goal_weight / 5
  # 1 = 11 / 5
  # amounts to 2 instead of 1 bc in ruby 11 / 5 == 2

  # what do we need, what r we given and what have we used.

  big_bars_needed = goal_weight / 5

  # do we have enuf big bars for the need? how many should we use?

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

puts make_chocolate(10,1,11)
#=> should return 6 based on code

# We gotta return the number of small bars we are using but we have to use up all the big bars first.

# In above example we use the one big bar we have and that ends up using 5 kilos from our goal of 11 kilos

# The code returns -1, so the code is using the big bar and using up 5 kilos from our goal of 11 and then proceeds to use 5 small bars for 1 kilos each so 5 kilos and ends up 10 instead of 11 so we are one short.

# We want six kilos but we are ending up with four kilos ### problem

# WE WANT 6 BUT WE ARE GETTING -1 ###############

def assert(actual, expected)
  unless actual == expected
    throw "Expected #{expected}, but was #{actual}"
  end
end

assert(make_chocolate(2,2,13), -1)
assert(make_chocolate(3,2,13), 3)
assert(make_chocolate(3,3,13), 3)
assert(make_chocolate(10,1,13), 8)

puts "All tests successfully run!"