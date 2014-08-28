require_relative './taxi'

taxis = []

taxi1 = {"driver_name" => "sean", "city" => NYC, "color" => "yellow"}
taxi2 = {"driver_name" => "jeff", "city" => NYC, "color" => "green"}
taxi3 = {"driver_name" => "neel", "city" => NYC, "color" => "black"}

taxi1 = Taxi.new(taxi1)
taxi2 = Taxi.new(taxi2)
taxi3 = Taxi.new(taxi3)

taxis = [taxi1, taxi2, taxi3]

taxis.each do |taxi|
driver_name = taxi.getInfo["driver_name"]
city = taxi.getInfo["city"]
color = taxi.getInfo["color"]

puts "Im #{driver_name}, and i live in #{city}. I drive a #{color} taxi."
end