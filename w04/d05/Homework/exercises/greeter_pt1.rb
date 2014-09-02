
# grab a greeting from your class method
# create a new Greeter with that greeting and have them greet


require 'pry'

require_relative './lib/greeter_pt1'


greeting = Greeter.new(Greeter.random, "Juan Valdez")


greeting.say_hello


