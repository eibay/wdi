class Taxi

	def initialize(driver_name, city, color)
		@driver_name = driver_name
		@city = city
		@color = color
	end

	def taxi_info
		return "This taxi is driven by #{@driver_name}, it is located in #{@city} and the color is #{@color}"
	end
end