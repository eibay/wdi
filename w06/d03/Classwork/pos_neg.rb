# Given 2 integers, 
# return true if one is negative and one is positive.

# posNeg(1, -1)
# // true
# posNeg(-1, 1)
# // true
# posNeg(-4, -5)
# // false

def posneg(x,y) 
	if ( x < 0 && y > 0 ) || ( x > 0 && y < 0 )
		return true
	else
		return false
	end
end

posneg(1, -1)
posneg(-1, 1)
posneg(-4, -5)


def posneg(x,y) 
	if ( x < 0 && y > 0 ) || ( x > 0 && y < 0 )
		return true
	else
		return false
	end
end

posneg(1, -1)
posneg(-1, 1)
posneg(-4, -5)


