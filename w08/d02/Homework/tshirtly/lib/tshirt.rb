require "active_record"
require_relative "./connection.rb"
require_relative "./order.rb"

class Tshirt < ActiveRecord::Base

	def order
		Order.find_by(tshirt_id: self.id)
	end

end