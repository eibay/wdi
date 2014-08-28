# ask student for first name, last name, email
# print out to the terminal all info on terminal
# repeat the process

require_relative './student_class'

students = []

loop do
# student = []

puts "What is your first name?"
first_name = gets.chomp
# student.push(first_name)

puts "what is your last name?"
last_name = gets.chomp
# student.push(last_name)

puts "What is your email address?"
email = gets.chomp
# student.push(email)

student = Student.new(first_name, last_name, email)
# student = Student.new("first_name", "last_name", "email")

students.push(student)


students.each do |x|
	puts x.info
end
end

