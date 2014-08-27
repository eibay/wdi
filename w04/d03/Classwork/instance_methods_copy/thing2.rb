require 'pry'
require_relative './comedian2'



comedians = []

info = {"name" => "Sam", "age" => 40, "fav_joke" => "The man in the room..."}
comedian1 = Comedian.new(info)

binding.pry
# puts sam



# comedians.each do |comedian|
# 	comedian.tell_joke
# end