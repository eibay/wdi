require 'pry'
require_relative './taxi'

taxis = []

taxi_1_info = { driver_name: "harry", city: "Toronto", color: "green"}
taxi_2_info = { driver_name: "annie", city: "Melbourne", color: "yellow"}
taxi_3_info = { driver_name: "jackie", city: "Chicago", color: "black"}

taxi_1 = Taxi.new(taxi_1_info)
taxi_2 = Taxi.new(taxi_2_info)
taxi_3 = Taxi.new(taxi_3_info)

taxis << taxi_1
taxis << taxi_2
taxis << taxi_3

taxis.each do |taxi|
	taxi.GetInfo
end