class Taxi

	def initialize(hash)
		@name = hash["driver_name"]
		@city = hash["city"]
		@color = hash["color"]
	end

	def showInfo
		puts "#{@name} drives a #{@color} taxi in #{@city}"
	end
end
