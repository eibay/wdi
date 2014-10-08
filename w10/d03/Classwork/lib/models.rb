class Photo < ActiveRecord::Base

	end

	class Client < ActiveRecord::Base

	end

	class Album < ActiveRecord::Base
		self.has_many(:photos)
		# add an instance method that gets the photos

		def photos
			Photo.where({ album_id: self.id })
		end

	end

	class Category < ActiveRecord::Base

	end