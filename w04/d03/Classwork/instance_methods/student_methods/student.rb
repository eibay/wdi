class Student
	def initialize(first, last, email)
		@first = first
		@last = last
		@email = email
	end

	def txt_friendly
		return {first: @first, last: @last, email: @email}
	end

	# def student_view
	# 	return "#{@first} #{@last} - #{@email}"
	# end
end