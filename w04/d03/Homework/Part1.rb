class Taxi
	def initialize(name, city, color)
		@name = name
		@city = city
		@color = color
	end 


	def showInfo
		return "This taxi driver is named #{@name}, s/he lives in #{@city} and drives a #{@color} cab."
	end 
end 

taxi_drivers = Array.new()

driver1 = Taxi.new("Omar", "NYC", "Yellow")
driver2 = Taxi.new("Louise", "Seattle", "green")
driver3 = Taxi.new("John", "San Fran", "orange")

taxi_drivers.push(driver1, driver2, driver3)

taxi_drivers.each do |a|
	puts a.showInfo
end 