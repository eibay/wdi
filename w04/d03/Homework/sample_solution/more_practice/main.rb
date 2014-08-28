require_relative './shirt'
require_relative './car'

pearl_jam_t = Shirt.new("XL", "faded black", "Yield Tour 1998")
hipster_plaid = Shirt.new("M", "red", "NO LOGO")

puts ""
#I can't get to the information inside the shirt objects
#(Because I didn't make any methods to do so)
puts "so yeh I just made two shirts believe me its true"

puts ""

dads_miata = Car.new(1992, "Mazda", "Miata", "red")
puts "gonna start dads_miata..."
#think: why do I have to puts the result of this method..
#why doesn't the method itself print to the terminal?
puts dads_miata.start_engine

travs_first_car = Car.new(1995, "Oldsmobile", "Cutlass Cierra SL", "maroon")

#think: look at how I can just add the result of start_engine
#to the end of another string
puts "and here is travs engine: " + travs_first_car.start_engine
puts ""
