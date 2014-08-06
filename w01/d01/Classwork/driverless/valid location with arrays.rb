puts "Where do you want to go?"

location= gets.chomp

valid_locations = ["New York", "San Francisco", "Dallas"]


=begin
algorithm
1. location set to something (San Francisco)
2. check the first item in the list to see if San Francisco == item 1
3. continue (iterate) through each item in the list
=end


index = 0


while index <= 2 
	if valid_locations[index] == location
		found = true
	end
	index = index + 1
end

if found
	puts "yes"
else
	puts "no try again"
end