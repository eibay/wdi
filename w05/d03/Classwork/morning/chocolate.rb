

def make_chocolate(small_bars_given, big_bars_given, goal_weight)
  big_bars_used = goal_weight / 5

  if big_bars_given <= big_bars_needed
  	big_bars_used = big_bars_given
  else
  	big_bars_used = big_bars_needed
  end

  small_bars_needed = goal_weight - (big_bars_used * 5)

  if small_bars_used_needed || big_bars_used > big
    return -1
  else
    return small_bars_used
  end
end


#make_chocolate(4, 1, 9)
#=> 4
#make_chocolate(4, 1, 10)
#=> -1
#make_chocolate(4, 1, 7)

def assert(a, b)
	unless actual == expected
		throw "Expected #{expected}, but was #{actual}."
	end
end

assert(make_chocolate(2,2,13), -1)
assert(make_chocolate(3,2,13), 3)
assert(make_chocolate(3,3,13), 3)
assert(make_chocolate(10,1,13), 8)

math.abs
