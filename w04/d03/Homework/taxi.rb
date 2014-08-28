
class Taxi

	attr_accessor :driver_name
	attr_accessor :city
	attr_accessor :color

	def initialize(attributes)
		@driver_name=attributes[:driver_name]
		@city=attributes[:city]
		@color=attributes[:color]
	end

	def taxi_output
		puts "This taxi is driven by #{@driver_name} in #{@city} and its color #{@color}"
	end
end
