
require_relative './student'
require 'json'

file = JSON.parse('./students.txt')
students = []

loop do
  student = []

  puts "Student first name?"
  first = gets.chomp
  student << first

  puts "Student last name?"
  last = gets.chomp
  student << last

  puts "Student email?"
  email = gets.chomp
  student << email

  student1 = Student.new("#{student[0]}", "#{student[1]}", "#{student[2]}")

  students << student1

  students.each do |student|
    puts student.student_info
  end

end
