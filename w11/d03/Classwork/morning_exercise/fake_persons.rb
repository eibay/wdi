require 'faker'

hash_literal = {}

class Person
  def initialize name, phone_number 
    @name = name 
    @phone_number = phone_number 
  end 
end 

1000.times do |n| 
  person_name = Faker::Name.name 
  person_number = Faker::PhoneNumber.phone_number 
  person_object = Person.new person_name, phone_number 
  hash_literal[n] = person_object   
end 

p hash_literal 