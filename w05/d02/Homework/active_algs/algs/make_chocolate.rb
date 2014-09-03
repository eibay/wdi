require "pry"

def make_chocolate(small, big, goal)
	if small  + (big * 5) < goal
		return -1
	else
		if goal / 5 <= big
			return goal % 5
		else
			return goal - (big * 5)
		end
	end
end

binding.pry