x = -50
while x <= 50
	if x % 3 == 0 && x % 5 == 0
		puts "fizzbuzz"
	elsif x % 3 == 0
		puts "fizz"
	elsif x % 5 == 0
		puts "buzz"
	else puts x
	end
	x +=1
end
