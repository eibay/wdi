require 'active_record'

class Account < ActiveRecord::Base
	has_secure_password
end
