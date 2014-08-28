require "pry"

class Taxi

	def initialize(driver_name, city, color)
		@driver_name = driver_name
		@city = city
		@color = color
	end

	def get_info
		"This #{@color} #{@city} taxi is driven by hack #{@driver_name}."
	end

	def itemized_info
		"Driver: #{@driver_name}\nCity: #{@city}\nColor: #{@color.capitalize}"
	end

end

