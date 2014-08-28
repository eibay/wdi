class Taxi

	def initialize(taxi_info)
		@driver = taxi_info[:driver]
		@city = taxi_info[:city]
		@color = taxi_info[:color]
	end

# return all of the attributes to terminal as a string

	def putsInfoAll
		puts "Driver: #{@driver}"
		puts "City: #{@city}"
		puts "Color: #{@color}"
	end

end
