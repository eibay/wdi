require 'active_record'

class Category < ActiveRecord::Base
	 def album
	 	Album.find_by(id: self.album.id)
	 end 
end

class Client < ActiveRecord::Base
end

class Photo < ActiveRecord::Base
end

class Album < ActiveRecord::Base
	self.has_many(:photos)
end