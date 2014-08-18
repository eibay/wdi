require 'pry'

location = "San Francisco"

valid_locations = ["New York", "San Francisco", "Dallas"]

# new_york = "New York"
# san_fran = "San Francisco"
# dallas = "Dallas"
# valid_locations = [new_york, san_fran, dallas]


index = 0
found = false

while (index <= 2 && valid_locations[index] != location)
  binding.pry
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

##### The above program basically says that the while loop will run if 0 is less than or equal to
##### 2, which through the laws of math will always be true and while the city of new york is not
##### the same as the city of san fran, which in reality will never be the same since they are diff cities
##### and in the context of ruby they are diff strings and the 0 position on the array which is ny does not
##### match what our location variable is set too, run the program based on conditionals until one of the index positions on
#### the array matches our location string, IF it does puts YES WE GO THERE, as that is our location and
#### where we want to go, if it doesnt match where we wanna go, basically san fran in this case, puts
#### umm try again :(, ALSO so we dont have an infinite loop rem to increment our index value which we
#### set to 0 to eventually surpass 2 which we set in the while loop to have a way for our program to stop
#### looping and eventually exit after it has run through the data provided so we dont have an infinite loop
#### and have an endpoint.

# if found
#   puts "Yes we go there!"
# else
#   puts "No try again"
# end



# if (location == "New York")
#   puts "Yes we go there!"
# elsif location == "San Francisco"
#   puts "Yes we go there!"
# elsif location == "Dallas"
#   puts "Yes we go there!"
# else
#   puts "Um...try again"
# end

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
