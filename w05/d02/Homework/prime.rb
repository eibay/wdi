# require 'prime'

# Prime.each(100) do |prime|
# 	puts prime
# end

prime = true
n = 15
test = 2..(n-1)
test.each do |r|
	if n % r == 0
		prime = false
	end
end

puts prime