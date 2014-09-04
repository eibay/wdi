
# mine doesn't work
def make_chocolate(small, big, goal)

	big_total = 5 * big
	small_total = 1 * small

	step1 = goal - big_total
	if step1 >= small_total
		return step1
	else
		return -1
	end
end

make_chocolate(4, 1, 9)
make_chocolate(4, 1, 10)
make_chocolate(4, 1, 7)


def make_chocolate(small, big, goal_weight)

   if 
   	big * 5 <= goal_weight
   	big_bars_used = big
   	return big_bars_used
   else
   	remainder = goal_weight % 5
   	big_bar_weight = goal_weight - remainder
   	big_bars_used = big_bar_weight / 5
   	return big_bars_used
   end

small_weight_needed = goal_weight - (big_bars_used * 5)

	if 
		small_weight_needed > small
		return -1
	else
		return small
	end
puts "#{big_bars_used} big and #{small}"

end


make_chocolate(10,1,11)
#=> 6


make_chocolate(4, 1, 9)
make_chocolate(4, 1, 10)
make_chocolate(4, 1, 7)





