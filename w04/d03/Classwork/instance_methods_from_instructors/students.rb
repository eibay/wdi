require 'pry'
require_relative 'student.rb'

students = []

x = 0
while x < 2

	puts "Whats the student's first name?"
	first = gets.chomp
	puts "Whats the student's last name"
	last = gets.chomp
	puts "Whats the student's email?"
	email = gets.chomp
	
	student = Student.new(first, last, email)

	students << student

	x = x + 1
end

binding.pry