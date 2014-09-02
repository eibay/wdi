require_relative "./greeter"
require 'pry'

puts "Enter name of a greeter to search"
name = gets.chomp

greeter = Greeter.find_by("name", name)

puts "#{name} says '#{greeter["greet"]}'"