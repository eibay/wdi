require_relative "./student.rb"

3.times do
puts "Give me a student's first name"
first = gets.chomp
puts "Give me a student's last name"
last = gets.chomp
puts "Give me their email"
email = gets.chomp

student = Student.new(first, last, email)

student.add(student)

puts Student.present_all()
end


