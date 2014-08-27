require 'pry'


class Taxi

	def initialize(driver_name, city, color)
		@driver_name = driver_name
		@city = city
		@color = color
	end


	def attributes
		return "#{@driver_name} (#{@city}): color - #{@color}"
	end

end


taxi = Taxi.new("yoyo", "NYC", "yellow")

puts taxi.attributes