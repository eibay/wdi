require_relative "./greeter"


greetings = ["So nice to see you!", "You're looking svelte!", "Hello and best wishes!", "It's been too long!"]

loop do

	puts "Please, enter a human name."

	name = gets.chomp

	greeter = Greeter.create({"name" => name, "greeting" => greetings[rand(0..3)]})

	greeters = Greeter.all

	greeters.each{|greeter| puts "Hi!  I'm #{greeter["name"]}.  #{greeter["greeting"]}"}



end