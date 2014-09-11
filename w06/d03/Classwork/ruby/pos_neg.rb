# Given 2 integers, return true if one is negative and one is positive.

# posNeg(1, -1)
# // true
# posNeg(-1, 1)
# // true
# posNeg(-4, -5)
# // false

def posneg (number1, number2)
	if number1 > 0 && number2 < 0
		puts "True"
	elsif number1 < 0 && number2 > 0
		puts "True"
	else
		puts "False"
	end
end

posneg(1, -1)
posneg(-1, 1)
posneg(-4, -5)