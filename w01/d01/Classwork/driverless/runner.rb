


def shutdown
	puts "how much gas have we got?"
	gas = gets.chomp.to_i #everything we get from the terminal is a string
	# unless gas.is_a? Fixnum 
	# 	puts "i need a number."
	# end
	if gas != Integer
		puts "what? I need an integer"
	end

	while gas > 0 do
		puts "Running! Gas remaining: " + gas.to_s
		gas -= 1
		puts "Shutdown" if gas == 0
	end
end 
shutdown



# gas = 20

# while gas > 0 do
# 	puts "Running! Gas remaining: " + gas
# 	gas -= 1
# 	puts "Shutdown" if gas == 0
# end


