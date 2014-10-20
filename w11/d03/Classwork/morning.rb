require "faker"

class Person
	def initialize
		@name = Faker::Name.name
		@phone_number = Faker::PhoneNumber.phone_number
	end
end

people = {}
counter = 0
while counter < 1000
	people[counter] = Person.new
counter +=1
end
print people

folks={}
1000.times do |x|
	folks[x] = Person.new
end
print folks







