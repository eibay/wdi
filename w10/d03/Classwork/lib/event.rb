class Event < ActiveRecord::Base
	def albums
		Album.where(event_id: self.id)
	end

	self.has_many(:albums)

end