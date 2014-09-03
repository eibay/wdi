require_relative "./connection"
require "active_record"

class Senator < ActiveRecord::Base

	def bills
		Bill.where(senator_id: self.id)
	end
end