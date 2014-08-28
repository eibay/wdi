# Part 1

# Create a Taxi class with the attributes - driver_name, city, color
# Add a method that returns all of the attributes to the terminal as a string

class Taxi


	def initialize (taxis)
		@driver_name = taxis[:driver_name]
		@city = taxis[:city]
		@color = taxis[:color]		
	end

	def taxi_info
		puts "#{@driver_name}, #{@city}, #{@color}"
	end

end