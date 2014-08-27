class Student

	def initialize (first_name, last_name, email)
		@first_name = first_name
		@last_name = last_name
		@email = email
	end

	def list_info
		puts "#{@first_name} #{@last_name}, #{@email}"
	end
end