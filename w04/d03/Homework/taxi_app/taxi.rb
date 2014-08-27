class Taxi

	def initialize(attribute)
		@driver_name = attribute[:name]
		@city = attribute[:city]
		@color = attribute[:color]
	end

	def stringIt
		return "#{@driver_name} is from #{@city} and drives a #{@color} taxi."
	end
end

driver1 = Taxi.new({name: "Alex", city: "NYC", color: "Yellow"})
driver2 = Taxi.new({name: "Latka", city:"NYC", color: "Yellow"})
driver3 = Taxi.new({name: "Tony", city:"NYC", color: "Yellow"})

drivers = [driver1, driver2, driver3]

drivers.each do |t|
	puts t.stringIt
end