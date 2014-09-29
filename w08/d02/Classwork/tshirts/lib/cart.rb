class Cart < ActiveRecord::Base

	def shirt
		Shirt.find_by(id: self.shirt_id)
	end

end
