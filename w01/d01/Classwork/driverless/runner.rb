gas = gets.chomp

gas = gas.to_i

while gas > 0
	gas = gas -1
	puts "running..."
end
puts "Car shut down"