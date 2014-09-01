require_relative "./greeter"
require "pry"


john = Greeter.new("John", Greeter.stock_greeting)

john.greet