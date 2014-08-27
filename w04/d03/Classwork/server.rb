require 'pry'
require_relative './comedian.rb'




comedian1 = Comedian.new("Bozo", 30, "knock")
comedian2 = Comedian.new("Joe", 32, "hello")

comedians = [comedian1, comedian2]

comedians.each do |comedian|
  puts comedian.tell_joke
end

