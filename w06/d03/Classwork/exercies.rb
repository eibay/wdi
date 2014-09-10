require 'pry'

def posNeg (x, y)

	if x > 0 && y < 0
		return true
	elsif x < 0 && y > 0
		return true
	else
		return false
	end

end
binding.pry


#PART 2


def countX (string)
	i = 0
	count = 0

	while i < string.length
		if string[i] == 'x' && string[i+1] == 'x'
			count += 1
		end
	i += 1
	end

	return count
end