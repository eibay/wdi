class Album < ActiveRecord::Base
	self.has_one(:event)
	self.has_many(:photos)
	self.belongs_to(:client)

	def photos
		Photo.where(album_id: self.id)
	end

end

