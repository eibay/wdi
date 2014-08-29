require_relative "./student_with_hashesf.rb"


puts "Give me a student's first name"
first1 = gets.chomp
puts "Give me a student's last name"
last1 = gets.chomp
puts "Give me their email"
email1 = gets.chomp

student_hash1 = {}
student_hash1["first"] = first1
student_hash1["last"] = last1
student_hash1["email"] = email1

student1 = Student.new(student_hash1)

puts "Give me a student's first name"
first2 = gets.chomp
puts "Give me a student's last name"
last2 = gets.chomp
puts "Give me their email"
email2 = gets.chomp

student_hash2 = {}
student_hash2["first"] = first2
student_hash2["last"] = last2
student_hash2["email"] = email2

student2 = Student.new(student_hash2)

puts "Give me a student's first name"
first3 = gets.chomp
puts "Give me a student's last name"
last3 = gets.chomp
puts "Give me their email"
email3 = gets.chomp

student_hash3 = {}
student_hash3["first"] = first3
student_hash3["last"] = last3
student_hash3["email"] = email3

student3 = Student.new(student_hash3)

puts "#{student1.getInfo["first"]} #{student1.getInfo["last"]}, #{student1.getInfo["email"]}"
puts "#{student2.getInfo["first"]} #{student2.getInfo["last"]}, #{student2.getInfo["email"]}"
puts "#{student3.getInfo["first"]} #{student3.getInfo["last"]}, #{student3.getInfo["email"]}"




