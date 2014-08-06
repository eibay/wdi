puts("What color is the light!?")
light = gets.chomp
    if light == "red"
    	puts("Stop")
	elsif light == "green"
		puts("Go")
	elsif light == "yellow"
		puts("Slow Down")
    else
        puts("That is not a light...")
    end
