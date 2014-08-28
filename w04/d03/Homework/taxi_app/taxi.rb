class Taxi

	def initialize(attr)
		@driver_name = attr["name"]
		@city = attr["city"]
		@color = attr["color"]
	end

	def getInfo
		return "#{@driver_name} drives a #{@color} taxi in #{@city}"
	end






















end