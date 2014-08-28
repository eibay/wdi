class Student

	def initialize(first_name, last_name, email)
		@first_name = first_name
		@last_name = last_name
		@email = email
	end

	def info
		puts @first_name 
		puts @last_name 
		puts @email
	end
end