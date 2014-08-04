puts "How many gallons are in your tank?"
gas = gets.chomp.to_i
 	until gas == 0
 	puts gas -= 1
end

if gas == 0 
	puts "car is out of gas!" 
end

# or

gas = 20
while gas >0
	gas = gas -1
	puts "running..."
end
puts "Car shut down"