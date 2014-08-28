require "pry"
require "json"
require_relative "./students"

students = Student.recall

loop do

	puts "Please enter your first name."
	first_name = gets.chomp.downcase.capitalize
	puts "And now, enter your last name."
	last_name = gets.chomp.downcase.capitalize
	puts "Please enter your email address now."
	email = gets.chomp.downcase

	student = Student.new(first_name, last_name, email)

	student.remember

	students << student

	

	students.each {|student| puts "#{student.first} #{student.last}: #{student.email}"}


end