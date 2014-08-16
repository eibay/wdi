require 'pry'

i = 99
while i > 0
	num = i.to_s
	puts "#{num} bottles of beer on the wall,"
	puts "#{num} bottles of beer,"
	puts "You take one down,"
	puts "You pass it around,"
	puts "#{(i - 1).to_s} bottles of beer on the wall!"
	puts

	i -= 1

end