class Taxi
	def initialize(attr)
		@driver_name = attr[:driver_name]
		@city = attr[:city]
		@color = attr[:color]
	end

	def getInfo
		# return {
		# 	"driver_name" => @driver_name,
		# 	"city" => @city,
		# 	"color" => @color
		# }
		puts "Im #{@driver_name}. Driving in #{@city} and I like #{@color}."

	end
end