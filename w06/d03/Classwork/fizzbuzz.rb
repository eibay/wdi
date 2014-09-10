# for 1..100 

# if  n%3 == 0 AND
#  n%5 == 0 
# prints FizzBuzz

# elsif n % 3 is 0
# print fizz

# elsif n%5 is 0
# print buzz

# else print end

n = (1..100)

n.each do |num|

if num % 3 == 0 && num % 5 == 0
	print "FizzBuzz"

elsif num % 3 == 0
	print "Fizz"

elsif num % 5 == 0
	print "Buzz"

else 
	print num

end
end

# or~~~~~~~~~~~

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

	n = n + 1
end

