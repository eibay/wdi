require 'pry'


def make_chocolate(small, big, goal)
	
	if goal < (big * 5)
		remainder = goal % 5
		
		if remainder > small
			puts -(remainder - small)
		else
			puts remainder
		end

	else
		
		remainder = goal - (big * 5)
		if remainder > small
			puts -(remainder-small)

		else 
			puts remainder
		end
	end

end

binding.pry