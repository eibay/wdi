require 'active_record'

class Senator < ActiveRecord::Base

	def bill
		Bill.where({sponsor_id: self.bioguide_id})
	end
end