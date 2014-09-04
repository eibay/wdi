# def make_chocolate(small, big, goal)
#     if goal / 5 > big
#     	return -1
#     else
# 	    small = goal % 5
#     end
# end

# puts make_chocolate(4, 1, 9)
# puts make_chocolate(4, 1, 10)
# puts make_chocolate(4, 1, 7)
# puts make_chocolate(4, 3, 16)

def make_chocolate(small, big, goal)
	big_need = goal / 5

	if big < big_need
		
	small_need = goal % (big * 5)
	if small_need <= small
		return small
	else
		return -1
	end
end

def assert(actual, expected)
  unless actual == expected
    throw "Expected #{expected}, but was #{actual}"
  end
end

puts assert(make_chocolate(2,2,13), -1)
puts assert(make_chocolate(3,2,13), 3)
puts assert(make_chocolate(3,3,13), 3)
puts assert(make_chocolate(10,1,13), 8)