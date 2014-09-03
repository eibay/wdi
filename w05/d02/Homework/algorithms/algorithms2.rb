def make_chocolate(small, big, goal)
    if goal / 5 > big
    	return -1
    else
	    small = goal % 5
    end
end

puts make_chocolate(4, 1, 9)
puts make_chocolate(4, 1, 10)
puts make_chocolate(4, 1, 7)
puts make_chocolate(4, 3, 16)