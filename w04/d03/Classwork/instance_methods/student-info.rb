require 'pry'
require_relative './student.rb'

loop do

puts "What is your first name?"
first_name = gets.chomp

puts "What is your last name?"
last_name = gets.chomp

puts "What is your email address?"
email = gets.chomp

info = Student.new(first_name, last_name, email)

students = []
students << info

students.each do |student|
	student.list_info
	end	

end