# ActiveRecord and Algorithms
# Part 1: Write a command line app that prints prime numbers
# Print the prime numbers between 1-100
puts "Starting number?"
first_num = gets.to_i

puts "End number?"
last_num = gets.to_i

while first_num < last_num
	prime_num = true
	
x = 2

while x < first_num / 2
	if (first_num % x == 0)
	prime_num = false
	break
	end

x += 1

end

if prime_num 
	puts first_num.to_s + " is a prime number."
end

first_num+=1  

end