require 'pry'

class Taxi


	def initialize(driver_name, city, color)
		@driver_name = driver_name
		@city = city
		@color = color
	end

	def get_info
		return "#{@driver_name} is based in #{@city} and drives a #{@color} taxi."
end

end

