require 'json'
require 'pry'
require_relative './students'




loop do



puts "What is the students first name?"

first=gets.chomp

puts "What is the students last name?"

last=gets.chomp

puts "What is the students email"

email=gets.chomp

file=JSON.parse(File.read("./students.txt"))
student=Student.new({"first"=>first, "last"=>last, "email"=>email})
student_json=student.json
file.push(student)
File.write("./students.txt", file)
students=JSON.parse(File.read("./students.txt"))

students.each do |n|
	binding.pry

	x=Student.new(n)

	puts "#{x.first} #{x.last}-#{x.email}"
end











end

