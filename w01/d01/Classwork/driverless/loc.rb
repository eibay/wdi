loc = ["NYC", "San"]

puts("where?")
destination = gets.chomp

loc.each {
	|loc| if loc == destination
		puts("yep")
else
	puts("nope") end
}

