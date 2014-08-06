def gas(gallons)
	if gallons > 0
		gallons -= 1
	else
		puts "sorry but you are out of gas."
	end
end

gas(20)

while true

def gas(gallons)
	while true
		gallons -= 1
		if gallons < 1
			break
		end
	end
	puts "sorry but you are out of gas."
end

gas(20)

# teacher version
gas = 20

while gas > 0
	gas = gas - 1
	puts "running...."
end

puts "Car Shut Down"