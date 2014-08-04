puts "[R]ed, [Y]ellow, [G]reen. What state is the light on? "
state = gets.chomp.downcase

if state == 'r'
	puts "Stopping..."
elsif state == 'g'
	puts "Going..."
elsif state == 'y'
	puts "Slowing down"
else
	puts "Please enter a valid light state."
	puts "[R]ed, [Y]ellow, [G]reen. What state is the light on? "
	state = gets.chomp.downcase
end
