require 'pry'
require_relative './lib/greeter2'

counter = 0
while counter < 3
puts "name?"
name = gets.chomp

greeting = Greeter.greet

hash = {
	"greeting" => greeting,
	"name" => name
}
#LINE 16 CAUSES PREVIOUSLY CREATED GREETERS TO BECOME NULL, BREAKING THE PROGRAM
newgreeter = Greeter.create(hash)

allgreeters = Greeter.all()

allgreeters.each do |greeter|
	greeter.greet
end
counter += 1
end