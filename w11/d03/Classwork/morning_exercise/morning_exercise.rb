require "pry"
require "faker"

class Person

# 	def initialize
# 		@name = Faker::Name.name
# 		@phone_number = Faker::PhoneNumber.phone_number
# 	end
# end
# nums = [*1..1000]

# person_hash = {}

# nums.each do |num|
# 	person_hash[num] = Person.new
# end

	def initialize(name, phone_number)
		@name = name
		@phone_number = phone_number
	end

end

# nums = [*1..1000]

# person_hash = {}

# nums.each do |num|
# 	person_hash[num] = Person.new(Faker::Name.name, Faker::PhoneNumber.phone_number)
# end

1.upto(1000)



binding.pry