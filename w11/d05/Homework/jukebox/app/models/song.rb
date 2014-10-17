class Song < ActiveRecord::Base

	def get_artist
		return Artist.find(self.artist_id)
	end
	
end