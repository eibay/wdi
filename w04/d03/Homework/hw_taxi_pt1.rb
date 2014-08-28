require 'pry'
require_relative './taxi'

all_taxi = []
#create empty array

taxi_1 = {:driver_name => "Tom", :city => "New York", :color => "red"}
taxi_2 = {:driver_name => "Joe", :city => "Atlanta", :color => "black"}
taxi_3 = {:driver_name => "Harry", :city => "Boston", :color => "white"}
#assign variable to the different drivers info

taxi_drivers1 = Taxi.new(taxi_1)
taxi_drivers2 = Taxi.new(taxi_2)
taxi_drivers3 = Taxi.new(taxi_3)
#invokes the Class Taxi for all three taxi driver

all_taxi << taxi_drivers1
all_taxi << taxi_drivers2
all_taxi << taxi_drivers3
#pushing taxi_drivers to the all_taxi array


all_taxi.each do |x|
	x.taxi_info
#Have each taxi driver in the all_taxi array to puts by taxi_info instance method

end