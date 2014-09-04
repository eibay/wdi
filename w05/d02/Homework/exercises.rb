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

# We want make a package of goal kilos of chocolate. We have small bars (1 kilo each) and big bars (5 kilos each). Return the number of small bars to use, assuming we always use big bars before small bars. Return -1 if it can't be done.

2, 1, 11

def make_chocolate (small_bars_given, big_bars_given, goal)
	big_bars_needed = goal / 5

	# do we have enough big bars for the need? how many should we use?

	#do we have enough to fulfill the need?
	if big_bars_given <= big_bars_needed
		big_bars_used = big_bars_given
	else
	# if not, use the amount of the big bars given + small bars
		big_bars_used = big_bars_needed
	end

binding.pry

	small_bars_needed = goal - (big_bars_given * 5)

	if small_bars_used > small || big_bars_used > big
		return -1
	else
		return small_bars_used
	end
end

### testing ###
# /Users/jeff/dev/wdi/rosencrantz/w05/d02/Instructors/hw_review/chocolate.rb
def assert(actual, expected)
  unless actual == expected
    throw "Expected #{expected}, but was #{actual}"
  end
end

assert(make_chocolate(2,2,13), -1)
assert(make_chocolate(3,2,13), 3)
assert(make_chocolate(3,3,13), 3)
assert(make_chocolate(10,1,13), 8)
