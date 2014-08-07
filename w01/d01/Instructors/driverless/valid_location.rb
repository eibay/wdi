<<<<<<< HEAD
# location = "Boston"
=======
location = "San Francisco"

valid_locations = ["New York", "San Francisco", "Dallas"]

# new_york = "New York"
# san_fran = "San Francisco"
# dallas = "Dallas"
# valid_locations = [new_york, san_fran, dallas]


index = 0
found = false

while (index <= 2 && valid_locations[index] != location)
  if location == valid_locations[index]
    puts "YES WE GO THERE!"
  else
    puts "Umm. try again :("
  end

  index = index + 1

  # if valid_locations[index] == location
  #   found = true
  # end
end

# if found
#   puts "Yes we go there!"
# else
#   puts "No try again"
# end


>>>>>>> 4516c13c701d05e43cf7d4d3926037e47e971f19

# if (location == "New York")
#   puts "Yes we go there!"
# elsif location == "San Francisco"
#   puts "Yes we go there!"
# elsif location == "Dallas"
<<<<<<< HEAD
#     puts "Yes we go there!"
=======
#   puts "Yes we go there!"
>>>>>>> 4516c13c701d05e43cf7d4d3926037e47e971f19
# else
#   puts "Um...try again"
# end

<<<<<<< HEAD
# location = "Boston"

# case location
# when (location == "New York") || (location == "Dallas") || (location == "San Francisco")
# 	puts "Yes we go there!"
# else
# 	puts "Try again... :("
# end

# new_york = "New York"
# san_fran = "San Francisco"
# dallas = "Dallas"
# valid_location = [new_york, san_fran, dallas]

location = "San Francisco"

valid_locations = ["New York" , "San Francisco", "Dallas"]

i = 0

while (i < valid_locations.length && valid_locations[i] != location)
	if location == valid_locations[i]
		puts "Good to go"
	else
		puts "Umm... Try again."
	end
	i += 1
end


=======
# case location
# when "New York"
#   puts "Yes, we go there!"
# when "San Francisco"
#   puts "Yes, there too!"
# when "Dallas"
#   puts "Sure."
# else
#   puts "Umm....try again :("
# end
>>>>>>> 4516c13c701d05e43cf7d4d3926037e47e971f19
