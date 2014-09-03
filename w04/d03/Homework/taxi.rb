
class Taxi

	def initialize(attr)
		@driver_name = attr[:driver_name]
		@city = attr[:city]
		@color = attr[:color]
	end

	def GetInfo
		puts "#{@driver_name} is from #{@city} and drives a #{@color} taxi."
	end

end
