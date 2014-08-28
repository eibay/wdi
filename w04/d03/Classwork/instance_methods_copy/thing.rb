require 'pry'
require_relative './comedian2'



comedians = []

info = {"name" => "Sam", "age" => 40, "joke" => "The man in the room..."}
sam = Comedian.new("Sam", 34, "blah ming")
comedians.push(sam)
george = Comedian.new("George", 30, "ching chong ha")
comedians.push(george)
wilma = Comedian.new("Wilma", 27, "bling bling")
comedians.push(wilma)


comedians.each do |comedian|
	comedian.tell_joke
end