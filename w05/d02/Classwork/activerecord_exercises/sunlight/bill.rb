class Bill < ActiveRecord::Base

	def senator
		Senator.find_by(bioguide_id: bioguide_id)
	end

end




