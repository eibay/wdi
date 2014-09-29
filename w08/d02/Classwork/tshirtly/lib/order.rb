require "active_record"

class Order < ActiveRecord::Base

	def self.get_pending_orders
		self.where(closed: false)
	end

end