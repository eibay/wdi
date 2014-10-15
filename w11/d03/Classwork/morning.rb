require "pry"
require "faker"

class Person

	attr_accessor(:name, :phone_number)

	def initialize
		self.name = Faker::Name.name
		self.phone_number = Faker::PhoneNumber.phone_number
	end
end



hash = {}
1.upto(1000) do |i|
	hash[i] = Person.new
end

binding.pry