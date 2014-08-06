puts("Where are we going?")
location = gets.chomp

# if (location ==
# 	"New York")||(location =="San Francisco")||(location == "Dallas")||(location == "Albequerque")||(location == "Toronto")
# 	puts("let's go")
# 	else
# 	puts("nope")
# end

case location
when "NYC"
	puts "fuggedabout"
when "San"
	puts "$$$"
else
	puts "whaaa?"
end