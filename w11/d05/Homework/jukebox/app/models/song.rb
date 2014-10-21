class Song < ActiveRecord::Base
	# belongs_to :artists


	def get_artist
		return Artist.find(Album.find(self.album_id).artist_id)
	end

end