class Client < ActiveRecord::Base
		self.has_many(:albums)
	def albums
		Album.where(client_id: self.id)
	end
end