require_relative "./connection.rb"

class Account < ActiveRecord::Base
	has_secure_password
end