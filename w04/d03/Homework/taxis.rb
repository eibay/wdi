require_relative './taxi'

taxis = []

taxi1 = { driver_name: "Tony Danza", city: "NYC", color: "yellow" }
taxis << Taxi.new(taxi1)

taxi2 = { driver_name: "George", city: "Washington, D.C.", color: "white" }
taxis << Taxi.new(taxi2)

taxi3 = { driver_name: "Frasier", city: "Seattle", color: "green"}
taxis << Taxi.new(taxi3)

taxis.each do |taxi|
	taxi.taxi_info
end