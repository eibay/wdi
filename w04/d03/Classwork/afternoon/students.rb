require 'json'
require 'pry'

class Student
	def initialize(first, last, email)
		@first = first
		@last = last
		@email = email
	end

	def hash
		student = {first: @first, last: @last, email: @email}
	end
end

loop do
	students = JSON.parse(File.read("./students.txt"))
	puts "\nStudents:"
	students.each {|student| puts "#{student["first"]} #{student["last"]}, #{student["email"]}"}
	print "\nEnter First Name: "
	first = gets.chomp
	print "Enter Last Name: "
	last = gets.chomp
	print "Enter Email: "
	email = gets.chomp

	name = Student.new(first, last, email)

	students << name.hash

	File.write("./students.txt", students.to_json)
end