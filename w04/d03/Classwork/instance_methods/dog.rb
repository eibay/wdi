require 'pry'

class Dog

	attr_accessor :name
	attr_accessor :age
	attr_accessor :breed


	def initialize (name, age, breed)
		@name= name
		@age=age
		@breed=breed
	end

def sit
 puts   "Sit #{@name}"
end


end
binding.pry