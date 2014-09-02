require_relative "./greeter"
require 'pry'

loop do 
	puts "Please name a new greeter"
	name = gets.chomp

	random_greet = Greeter.random_greeting
	new_greeter = {name: name, greet: random_greet}
	Greeter.create(new_greeter)

	greeters = Greeter.all
	greeters.each do |greeter|
		puts "#{greeter["name"]} says #{greeter["greet"]}"
	end
end