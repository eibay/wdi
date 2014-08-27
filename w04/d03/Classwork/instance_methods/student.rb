require 'json'


class Student
	def initialize(first, last, email)
		@first = first
		@last = last
		@email = email
	end

	def admit
		puts "first?"
		@first = gets.chomp
		puts "last?"
		@last = gets.chomp
		puts "email?"
		@email = gets.chomp
		student = [@first, @last, @email]
		all = Json.parse(File.read('./stud.txt'))
		all<<student
		File.write('./stud.txt', all.to_json)
		puts all 
	end
end

		