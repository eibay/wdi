require "pry"
require_relative "./taxi.rb"
require_relative "./user.rb"

taxi_1 = Taxi.new({"name" => "Bob", "city" => "New York", "color" => "yellow"})
taxi_2 = Taxi.new({"name" => "Arthur", "city" => "Boston", "color" => "red"})
taxi_3 = Taxi.new({"name" => "Josefe", "city" => "Manila", "color" => "green"})

puts taxi_1.getInfo
puts taxi_2.getInfo
puts taxi_3.getInfo

user_1 = User.new({"first_name" => "Martha", "last_name" => "Stewart", "gender" => "female-ish", "city" => "Hartford", "state" => "CT"})
user_2 = User.new({"first_name" => "Babba", "last_name" => "Wawa","gender" => "old lady", "city" => "New York", "state" => "NY"})
user_3 = User.new({"first_name" => "Joan", "last_name" => "Rivers","gender" => "undetermined", "city" => "Brooklyn", "state" => "NY"})

puts user_1.greeting
puts user_2.greeting
puts user_3.greeting

random_user1 = User.randomUser
random_user2 = User.randomUser

puts random_user1.greeting
puts random_user2.greeting
