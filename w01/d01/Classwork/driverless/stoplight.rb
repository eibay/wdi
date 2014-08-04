
puts ("What color is the light?")
light = gets.chomp 

# puts "red\n" if you did not put chomp 

if light == "red"
	puts ("STOP")
elsif light == "yellow"
	puts ("Slow Down")
elsif light == "green"
	puts ("Go")
else 
	puts ("That is not a light")
end