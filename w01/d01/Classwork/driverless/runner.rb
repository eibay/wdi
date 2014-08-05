puts "How much gas?"
gas = gets.chomp.to_i
while gas > 0
#	puts "gas = #{gas}"
	gas -= 1
	puts "running..."
	puts "car shut down" if gas <= 0
end