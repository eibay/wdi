# // Sum 10

# // Given 2 integers, return true if one if them is 10 or if their sum is 10.

# // makes10(9, 10)
# // // true
# // makes10(9, 9)
# // // false
# // makes10(1, 9)
# // // true

def makes10 (num1, num2)
	if num1 + num2 == 10 
		return true
	elsif num1 == 10 || num2 == 10
		return true
	else
		return false
	end
end

makes10(9, 10)
makes10(9, 9)
makes10(1, 9)

