require_relative './car'
require_relative './clown'
require 'pry'







info_1 ={"name"=>"Fuzzy", "shoe_size"=>"2", "car_id"=>"42431a7b575714c554803ab878f39d98"}
info_2 = {"name"=>"Wuzzy", "shoe_size"=>"82", "car_id"=>"d7be2a8878893d041bb5b7c732c99ad5"}


clown_1 = Clown.new(info_1)
clown_2 = Clown.new(info_2)

# puts clown_1["car_id"]
# puts clown_1.car["color"]

blue_car = Car.find_by("color", "Blue")
puts blue_car.clowns




fuzzy = Clown.find_by("name", "Fuzzy")
puts fuzzy.car