
def drive(light)
	if light == "red"
		puts("STOP!")
	elsif light == "green"
		puts("Go right ahead, buddy.")
	elsif light == "yellow"
		puts("Slow down there.")
	else
		puts("This traffic light is broken.")
	end			
end
drive("xxcxcxc")

def drive2(light)
	case 
	when light == "red" then puts "Stop!"
	when light == "green" then puts "Go ahead."
	when light == "yellow" then puts "Careful now."
	else puts "Broken light here."
	end
end
drive2("red")

def drive3(light)
	case light
	when "red" then puts "Stop!"
	when "green" then puts "Go ahead."
	when "yellow" then puts "Careful now."
	else puts "Broken light here."
	end
end
drive3("yellow")

