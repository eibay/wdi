class Senator < ActiveRecord::Base

	def bills
		return Bill.where(senator_id: self.bioguide_id)
	end
end