require "active_record"
require_relative "./connection.rb"
require_relative "./order.rb"

class User < ActiveRecord::Base

	def order
		Order.find_by(user_id: self.id)
	end

end