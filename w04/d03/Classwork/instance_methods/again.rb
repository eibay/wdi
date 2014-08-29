require 'json'
require 'pry'
require_relative './students'

# loop do

# puts "What is the students first name?"

# first=gets.chomp

# puts "What is the students last name?"

# last=gets.chomp

# puts "What is the students email"

# email=gets.chomp


# dorms=JSON.parse(File.read("./dorms.txt"))
# dorm_id=dorms.sample["id"]


# student={"first"=>first, "last"=>last, "email"=>email , "dorm_id"=> dorm_id}
# Student.create(student)


Student.random_student

conor=Student.find_by("first","Conor")
puts conor.first
puts conor.dorm




# end

