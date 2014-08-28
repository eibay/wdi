class Student

	def initialize(f_name, l_name, email)
		@f_name = f_name
		@l_name = l_name
		@email = email
	end

	def bark
		puts "WOOOOF!"
	end

	def hello
		puts "HELLO! I am #{@name}, a #{@age} year old #{@breed}"
	end

end