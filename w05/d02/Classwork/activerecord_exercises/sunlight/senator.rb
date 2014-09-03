require_relative "./connection"

class Senator < ActiveRecord::Base

	def bills
		Bill.where(sponsor_id: self.bioguide_id)
	end
end