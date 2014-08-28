require 'pry'
require_relative './taxi'
#binding.pry

taxis = []

taxi_1_info = { driver: "Mo", city: "St. Louis", color: "Red"}
taxi_2_info = { driver: "Larry", city: "Omaha", color: "Green"}
taxi_3_info = { driver: "Curly", city: "Jackson Heights", color: "Blue"}

taxi_1 = Taxi.new(taxi_1_info)
taxi_2 = Taxi.new(taxi_2_info)
taxi_3 = Taxi.new(taxi_3_info)

taxis << taxi_1
taxis << taxi_2
taxis << taxi_3

taxis.each do | taxi |
	taxi.putsInfoAll
end
