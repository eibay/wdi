require 'pry'
require_relative './instance_methods/comedian.rb'




comedian1 = Comedian.new("Bozo", 30, "knock")
comedian2 = Comedian.new("Joe", 32, "hello")

comedians = [comedian1, comedian2]
#comedians = []
#comedians << comedian1
#comedians << comedian2
comedians.each do |comedian|
  comedian.tell_joke
end

#to get indivual out comedians[0] and method

#diff objectas are hash array string 
#and now comedian
#instance of a class in an object
#class is an abstract with methods that 
#can be done by the instance
