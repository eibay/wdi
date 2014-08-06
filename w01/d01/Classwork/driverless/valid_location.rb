location = "San Francisco"

valid_locations = ["New York", "San Francisco", "Dallas", "Albequerque", "Toronto"]
# or
# new_york = "New York"
# dallas = "Dallas"
# san_fran = "San Francisco"
# valid_locations = [new_york, dallas, san_fran]

index = 0
go = false

while index < 5
	if location == valid_locations[index]
		go = true
	end
	index += 1
end

if go
	puts "YES WE GO THERE!"
else
	puts "Umm. try again :("
end


# my solution
# affirmative = "Fasten your seat belts!"
# negative = "That's not a valid location."
# valid_locations = ["New York", "San Francisco", "Dallas", "Albequerque", "Toronto"]
# puts "What destination?"
# destination = gets.chomp
# valid_locations.include?(destination) ? response = affirmative : response = negative
# puts response


# puts "What destination?"
# destination = gets.chomp

#Our "or" lesson
# if destination ==  "Toronto" || "New York" || "San Francisco" || "Dallas" || "Albequerque"
# 	puts "Yes"
# else
# 	puts "No"
# end

# puts "What destination?"
# destination = gets.chomp
# if destination == "Toronto"
# 	puts "Fasten your seat belts!"
# 	elsif destination == "Dallas"
# 	puts "Fasten your seat belts!"
# 	elsif destination == "San Francisco"
# 	puts "Fasten your seat belts!"
# 	elsif destination == "Albequerque"
# 	puts "Fasten your seat belts!"
# 	elsif destination == "New York"
# 	puts "Fasten your seat belts!"
# else
# 	puts "Not a valid location"
# end

# puts "What destination?"
# destination = gets.chomp

# case destination
# 	when "New York"
# 		puts "Yes, we go there!"
# 	when "San Francisco"
# 		puts "Yes, we go there!"
# 	when "Toronto"
# 		puts "Okay!"
# 	when "Albequerque"
# 		puts "Yeah, why not?"
# 	when "Dallas"
# 		puts "You betcha!"
# 	else
# 		puts "You said what?"
# 	end
		