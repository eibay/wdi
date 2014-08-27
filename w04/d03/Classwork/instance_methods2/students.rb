require 'pry'

class Student


	def initialize(first, last, email)
		@first = first
		@last = last
		@email = email

	end

	def add
		@students = []
		@students << @first

	end

	def print
	
		puts @ students
	end

end


loop do
	puts "first?"
	first = gets.chomp
	puts "last?"
	last = gets.chomp
	puts "email?"
	email = gets.chomp

	student = Student.new(first, last, email)
	student.add
	student.print
	binding.pry

end