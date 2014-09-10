# def posNeg(x, y)
# 	if (x < 0 && y > 0) || (x > 0 && y < 0)
# 	puts true
# 	else 
# 	puts false
# 	end
# end

# # posNeg(1, -1)
# # posNeg(-1, 1)
# # posNeg(-4, -5) 

# def posNegBoo(x, y, boo)
# 	if boo == true
# 		if x < 0 && y < 0
# 			puts true
# 		else
# 			puts false
# 		end
# 	else
# 		if (x < 0 && y > 0) || (x > 0 && y < 0)
# 			puts true
# 		else 
# 			puts false
# 		end
# 	end
# end

# posNegBoo(1, -1, false)
# posNegBoo(1, 1, false)

# posNegBoo(1, 1, true)

# posNegBoo(-3, -1, true)


def xx(string)
x1 = 0
x2 = 1
total = 0
counter = 0
while counter < string.length
	if string[x1] == "x" && string[x2] == "x"
		total += 1
	end
	x1 += 1
	x2 += 1
	counter += 1
end
puts total
end

xx("abcxx")
xx("abcxxxxx")