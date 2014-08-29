

class Student
	def initialize(first, last, email)
		@first = first
		@last = last
		@email = email
	end 

	def show_info
		puts "#{@first} #{@last} - #{@email}"
	end
end

info = []

while true 

	puts "What is your first name?"

	first = gets.chomp

	puts "What is your last name?"

	last = gets.chomp

	puts "What is your email?"

	email = gets.chomp

	student = Student.new(first, last, email)
	info.push(student)
	
	info.each do |a|
		a.show_info
	end 	
	
end



