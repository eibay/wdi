
def make_chocolate(small, big, goal_weight)
  big_bars_needed = goal_weight / 5

  if big_bars_needed >= big
    big_bars_needed = big
  end

  small_bars_used = goal_weight - (big_bars_needed * 5)

  if small_bars_used > small 
    return -1
  else
    return small_bars_used
  end
end

#how to check easier

def assert(actual, expected)
  unless actual == expected
    throw "Expected #{expected}, but was #{actual}"
    #stop running with this message
    #can use raise (for more complicated error messgaes)too
    #stop ur program 
  end
end
#checks good for binding pry
assert(make_chocolate(2,2,13), -1)
assert(make_chocolate(3,2,13), 3)
assert(make_chocolate(3,3,13), 3)
assert(make_chocolate(10,1,13), 8)