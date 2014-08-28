class Taxi

	def initialize(driver_name, city, color)
		@driver_name = driver_name
		@city = city
		@color = color
	end

	def string
		return "driver: #{@driver_name}, city: #{@city}, color: #{@color}"
	end

end

taxi = Taxi.new("John", "NY", "Yellow") 
puts taxi.string