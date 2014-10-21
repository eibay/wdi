# Problem 1

x = 0
counter = 0
while x < 1000
	if x % 3 == 0
		counter = counter + x
		x += 1
	elsif x % 5 == 0
		counter = counter + x
		x += 1
	else 
		x += 1
	end
end
puts counter

# problem 2

x = 2
y = 1
total = 0
while total < 4000000
	if x % 2 == 0
		total = total + x
		z = x
		x = x + y
		y = z
	else
		z = x
		x = x + y
		y = z
	end
end
puts total

# problem 3

x = 600851475143
