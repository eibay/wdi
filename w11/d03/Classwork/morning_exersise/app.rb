require 'faker'
require 'pry'

class Person
  def initialize(name, number)
    @name, @number = name, number
  end  
end  

# array = []

# hash = {}

# i = 1

# while i < 1001
#   name = Faker::Name.name
#   number = Faker::PhoneNumber.phone_number
#   person = Person.new(name, number)  
#   a = {"id" => i, "Person" => person}
#   array << a
#   i = i + 1
#  end  

users = {}

1.upto(1000) do |x|
  name = Faker::Name.name
  number = Faker::PhoneNumber.phone_number
  person = Person.new(name, number)	

  users[x] = person
end

binding.pry