require_relative './lib/greeter'
require 'pry'


puts "What is your name?"
name = gets.chomp

newbies = Greeter.create(greeting: Greeter.random, name: "#{name}")

greeters = Greeter.all()

greeters.each do |hello|
	hello.say_hello
end






