# We want make a package of goal kilos of chocolate. We have small bars (1 kilo each) and big bars (5 kilos each). Return the number of small bars to use, assuming we always use big bars before small bars. Return -1 if it can't be done.

# def make_chocolate(small, big, goal)
#   # your code here
# end

# make_chocolate(4, 1, 9)
# #=> 4
# make_chocolate(4, 1, 10)
# #=> -1
# make_chocolate(4, 1, 7)
# #=> 2

# def make_chocolate(small, big, goal)
# 	big = big * 5
# 	remainder = goal - big
# 		if small >= remainder
# 			puts remainder
# 		else
# 			puts "-1"
# 		end
# end

# or
def make_chocolate(small, big, goal)
	bigbars_to_use = goal / 5
		if bigbars_to_use >= big
			small_bars_to_use = goal - (big * 5)
			if small < small_bars_to_use
				puts "-1"
			else
				puts small_bars_to_use
			end
		else
			small_bars_to_use = goal - (bigbars_to_use * 5)
			if small < small_bars_to_use
				puts "-1"
			else
				puts small_bars_to_use
			end
		end
	
end

make_chocolate(2,2,13)
make_chocolate(3,2,13)
make_chocolate(3,3,13)
make_chocolate(10,1,13)

# def assert(actual, expected)
#   unless actual == expected
#     throw "Expected #{expected}, but was #{actual}"
# 	end
# end


# assert(make_chocolate(2,2,13), -1)
# assert(make_chocolate(3,2,13), 3)
# assert(make_chocolate(3,3,13), 3)
# assert(make_chocolate(10,1,13), 8)

