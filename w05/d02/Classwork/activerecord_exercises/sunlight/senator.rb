class Senator < ActiveRecord::Base

	def bills
		Bill.where(bioguide_id: bioguide_id)
	end

end



