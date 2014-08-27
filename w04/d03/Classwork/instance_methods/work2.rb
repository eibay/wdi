require "pry"
require "json"
require_relative "./students"


loop do

	puts "Please enter your first name."
	first_name = gets.chomp.downcase.capitalize
	puts "And now, enter your last name."
	last_name = gets.chomp.downcase.capitalize
	puts "Please enter your email address now."
	email = gets.chomp.downcase

	Student.new(first_name, last_name, email).remember

	students = Student.recall

	students.each {|student| puts "#{student.first} #{student.last}: #{student.email}"}


end