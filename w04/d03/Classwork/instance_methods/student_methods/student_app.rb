require_relative './student.rb'
require 'pry'
require 'json'

while true

students_array = JSON.parse(File.read('./students.txt'))	

	puts "What is your first name?"
	fname = gets.chomp
	puts "What is your last name?"
	lname = gets.chomp
	puts "What is your email?"
	email = gets.chomp

	student = Student.new(fname, lname, email)
	students_array << student.txt_friendly

	binding.pry
	File.write('./students.txt', students_array.to_json)
	
	students_array.each do |x|
		puts x
	end
end