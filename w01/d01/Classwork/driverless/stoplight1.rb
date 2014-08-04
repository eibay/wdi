puts "What color is the light?"
light = gets.chomp
##light = "blue" 
# light = gets
# puts "red\n**\n"

if light == "Red"
	puts("Stop!")
elsif light == "Yellow"
	puts("Slow Down")
elsif light == "Green"
	puts("Go!")
else puts("That is not a light!")
end