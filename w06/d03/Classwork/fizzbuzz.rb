# n = (1..100)

# n.each do |num|
# 	if num % 3 == 0 && num % 5 == 0
# 			puts "FizzBuzz"
# 		elsif num % 3 == 0
# 			puts "Fizz"
# 		elsif num % 5 == 0
# 			puts "Buzz"
# 		else
# 			puts num
# 	end
# end

n = 0

while n <= 100
	if n % 3 == 0 && n % 5 == 0
			puts "FizzBuzz"
		elsif n % 3 == 0
			puts "Fizz"
		elsif n % 5 == 0
			puts "Buzz"
		else
			puts n
	end
	n += 1
end