class Bill < ActiveRecord::Base

	def senator
		return Senator.find_by(bioguide_id: self.senator_id)
	end
end