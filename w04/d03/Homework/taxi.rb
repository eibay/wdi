class Taxi

	def initialize (driver_taxi)

		@name = driver_taxi[:driver_name]
		@city = driver_taxi[:city]
		@color = driver_taxi[:color]

	end


	def taxi_info

 		puts "Driver: #{@name}"
 		puts "City: #{@city}"
 		puts "Color: #{@color}"

	end

end