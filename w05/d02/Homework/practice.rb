def make_chocolate(small, big, goal_weight)
  	if big * 5 < goal_weight  	
  		big_bars_used = big  
  	else big_bars_used 

  	end 		
  		big_bars_used = goal_weight / 5
		small_bars_used = goal_weight - (big_bars_used * 5)

		  if small_bars_used > small 
		    return -1
		  else
		    return small_bars_used
		  end
	else 
		big_bars_used = big  
		small_bars_used = goal_weight - (big_bars_used * 5)
		if small_bars_used > small 
			return -1
		else return small_bars_used
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