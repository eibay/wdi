numbers = []

loop do 

puts "To add a number, type 'add number.'"
puts "To show the current list of numbers, type 'show.'"

input = gets.chomp

if input.split(' ')[0] == "add"
	number = input.split(' ')[1]
	numbers << number
	puts "#{number} added!"
elsif input == "show"
	puts numbers.join(', ')
else
	puts "Don't know what #{input} is, try again."
end

end