
puts "Where do you want to go?"
location = gets.chomp.capitalize

# if location == "New York" 
# 	puts "Yes, let's!"
# elsif location == "San Francisco" 
# 	puts "Yes, let's!"
# elsif location == "Dallas" 
# 	puts "Yes, let's!"
# elsif location == "Alburquerque" 
# 	puts "Yes, let's!"
# elsif location == "Toronto"
# 	puts "Yes, let's!"
# else 
# 	puts "Nope, can't go"
# end





# if location == "New York" || if location == "San Francisco" || if location == "Dallas"  || if location == "Alburquerque" || if location == "Toronto"
# 	puts "Yes, let's!"
# else 
# 	puts "Nope, can't go"
# end




# if location == "New York" || location == "San Francisco" || location == "Dallas"  || location == "Alburquerque" || location == "Toronto"
# 	puts "Yes, let's!"
# else 
# 	puts "Nope, can't go"
# end


# if location == ("New York") || ("San Francisco") || ("Dallas")  || ("Alburquerque") || ("Toronto")
# 	puts "Yes, let's!"
# else 
# 	puts "Nope, can't go"
# end




if (location == "New York") || (location == "San Francisco") || (location == "Dallas")  || (location == "Alburquerque") || (location == "Toronto")
	puts "Yes, let's!"
else 
	puts "Nope, can't go"
end



# diff from location == ('New Nork' || 'dallas' )
# basically saying: is location = to this abstract equation of truthiness.

def wego
locations = ["nyc", "sf", "la"]
where = gets.chomp

locations.each do |x|
	if x == where
		puts "we go there"
	else
		puts "we don't go there"
	end
end





