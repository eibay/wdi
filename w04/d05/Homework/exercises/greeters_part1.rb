require_relative "./greeter"

random_greet = Greeter.random_greeting
salutation = Greeter.new(random_greet, "Sean")

puts salutation.say