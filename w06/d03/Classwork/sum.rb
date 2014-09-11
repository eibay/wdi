Given 2 integers, 
return true if one if them is 10 or if their sum is 10.

makes10(9, 10)
// true
makes10(9, 9)
// false
makes10(1, 9)
// true

def makes10(x,y)
	if ( x == 10 ) || ( y == 10 ) || ( x + y == 10 ) 
		return true
	else 
		return false
	end
end

makes10(9,10)

makes10(9,9)

makes10(1, 9)