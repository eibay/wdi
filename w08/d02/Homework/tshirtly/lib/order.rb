require_relative "./connection.rb"
require_relative "./tshirt.rb"
require_relative "./user.rb"

class Order < ActiveRecord::Base

	def tshirt
		Tshirt.find_by(id: self.tshirt_id)
	end

	def user
		User.find_by(id: self.user_id)
	end

end