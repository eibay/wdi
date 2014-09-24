require 'active_record'

class User < ActiveRecord::Base
	def find_tshirt
		Tshirt.find(user.tshirt_id)     
	end
end