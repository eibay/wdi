# def make_chocolate(small, big, goal)
#   b = 5
#   s = 1
#   small_result = (b*(big)) - (s*(small))
#   if small_result + b*(big) > goal
#      puts -1
#   else
#     puts small_result
#   end
#
# end

def make_chocolate(small, big, goal_weight)
  big_bars_used = goal_weight / 5
  small_bars_used = goal_weight - (big_bars_used * 5)

  if big_bars_used > big
    small_bars_used = goal_weight - (big_bars_used*5 - big*5)
    return small_bars_used

  #
  # if big_bars_used > big && small_bars_used < small
  #   return small_bars_used
  elsif small_bars_used > small
    return -1
  else
    return small_bars_used
  end
end

make_chocolate(10,1,11)
