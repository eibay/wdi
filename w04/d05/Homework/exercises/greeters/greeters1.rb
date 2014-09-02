require 'pry'
require_relative './lib/greeter'


puts "name?"
name = gets.chomp

greeting = Greeter.greet

newgreeter = Greeter.new(greeting, name)
puts newgreeter.greet