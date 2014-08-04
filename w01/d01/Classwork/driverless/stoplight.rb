
# def traffic(light)

# 	if light == "red"
# 		puts "STOP!"

# 	elsif light == "green"
# 		puts "GO!"

# 	elsif light == "yellow"
# 		puts "SLOW DOWN"

# 	else 
# 		puts "that, my friend, is not a light."
# 	end

# end

# traffic("green")
# traffic("yellow")
# traffic("red")
# traffic("blue")


def traffic

	cdputs "what color is the light?"
	light = gets.chomp

	if light == "red"
		puts "STOP!"

	elsif light == "green"
		puts "GO!"

	elsif light == "yellow"
		puts "SLOW DOWN"

	else 
		puts "that, my friend, is not a light."
	end

end
traffic


