array = [*1..100]

array.each do |n|
	if n % 3 == 0 && n % 5 == 0
		print "fizzbuzz"
	elsif n % 3 == 0
		print "fizz"
	elsif n % 5 == 0
		print "buzz"
	else 
		print n
	end
end

#############################

n = 0

while n <= 100
	if n % 3 == 0 && n % 5 == 0
		puts "fizzbuzz"
	elsif n % 3 == 0
		puts "fizz"
	elsif n % 5 == 0
		puts "buzz"
	else 
		puts n
	end

	n = n + 1
end



