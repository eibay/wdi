require 'active_record'

class User < ActiveRecord::Base

	has_secure_password

	# def initialize(email, password)
	# 	@email = email
	# 	@password = password
	# end

end

class Account < ActiveRecord::Base

end