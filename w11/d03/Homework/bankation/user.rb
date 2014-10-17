class User

	attr_accessor(:email, :password, :balance)

	def initialize(email, password)
		@email = email
		@password = password
		@balance = 0
	end
end
