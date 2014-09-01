require_relative './lib/connection'
require_relative './lib/greeter'
require 'pry'

loop do 

puts "Type the name of your new greeter here"
greeter = gets.chomp

new_greeter = {
	name: greeter,
	greeting: Greeter.rand_greeting,
}

Greeter.create(new_greeter)

Greeter.all.each do |g|
	name = g["name"]
	puts "My name is #{name}."
	puts g["greeting"]
end

end

