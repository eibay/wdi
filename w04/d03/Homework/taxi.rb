class Taxi

	def initialize(driver_name, city, color)
		@driver_name = driver_name
		@city = city
		@color = color
	end

	def response
		puts "Taxi driver's name is #{@driver_name}, he works in #{@city}, and the color of his cab is #{@color}."
	end
end

driver = Taxi.new("Mike", "NYC", "yellow")
driver1 = Taxi.new("Chris", "NYC", "green")

puts driver.response
puts driver1.response

	


