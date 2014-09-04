require 'pry'


def make_chocolate(small, big, goal_weight)

  big_bars_used = goal_weight / 5

  small_bars_used = goal_weight - (big_bars_used * 5)

  if big_bars_used < big_bars_given
	small_bars_needed = (big_bars_given - big_bars_used).abs
  end
  
  return big

end

# make_chocolate(4, 1, 13)

puts "hello world"

binding.pry




# --------------

# def assert(actual, expected)
#   unless actual == expected
#     throw "Expected #{expected}, but was #{actual}"
#   end
# end

# assert(make_chocolate(2,2,13), -1)
# assert(make_chocolate(3,2,13), 3)
# assert(make_chocolate(3,3,13), 3)
# assert(make_chocolate(10,1,13), 8)