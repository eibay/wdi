class Song < ActiveRecord::Base
	# belongs_to :artists


	def get_artist
		return Artist.find(self.artist_id)
	end

end