require 'pry'

num = 5

range = (2..num-1).to_a
binding.pry

if num % (range.each {|n| return n}) == 0
	puts "not prime"
else
	puts "#{num} is prime"

end
