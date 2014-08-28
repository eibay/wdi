require 'pry'

class Student

	def initialize(first, last, email)
		@first = first
		@last = last
		@email = email

	end


	def print
		puts "#{@first} #{@last}"
	end

end

students = []

loop do
	puts "first?"
	first = gets.chomp
	puts "last?"
	last = gets.chomp
	puts "email?"
	email = gets.chomp

	student = Student.new(first, last, email)
	
	students.push(student)
	
	students.each do |student|
		student.print
	end


end