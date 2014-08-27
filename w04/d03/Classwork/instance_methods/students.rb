require 'json'

class Student

	attr_reader :first, :last, :email

	def initialize(first, last, email)
		@first = first
		@last = last
		@email = email
	end

	def remember
		students = JSON.parse(File.read("./students.txt"))
		student = [self.first, self.last, self.email]
		students << student
		students_json = JSON.generate(students)
		File.write("./students.txt", students_json) 
	end

	def self.recall
		students = JSON.parse(File.read("./students.txt"))
		student_body = []
		students.each {|student| student_body << Student.new(student[0], student[1], student[2])}
		student_body
	end

end