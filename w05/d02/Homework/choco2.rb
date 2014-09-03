def make_chocolate(small, big, goal_weight)
  big_bars_used = goal_weight / 5
  	if big_bars_used > big
  		big_bars_used = big
  		small_bars_needed = goal_weight - (big * 5)
  		if small_bars_needed > small 
  			return -1
  		else
  			puts small_bars_needed
  		end
  	else

  		small_bars_used = goal_weight - (big_bars_used * 5)
  		if small_bars_used > small
  			return -1
  		else
  			return small_bars_used
		end	
	end
end