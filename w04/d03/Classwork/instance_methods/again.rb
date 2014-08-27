require 'json'
require_relative './students'




loop do



puts "What is the students first name?"

first=gets.chomp

puts "What is the students last name?"

last=gets.chomp

puts "What is the students email"

email=gets.chomp

file="./students.txt"
Student.list_all_students(file, first, last, email)


# file.push({"first"=>first, "last"=>last, "email"=>email})
# File.write("./students.txt" , file.to_json)
# students=JSON.parse(File.read("./students.txt"))


# students.each do |student|

# 	x=Student.new(student["first"],student["last"],student["email"])

# 	x.list_student
# end



end

