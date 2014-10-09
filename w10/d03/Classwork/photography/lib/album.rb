require 'active_record'

class Album < ActiveRecord::Base
	def photos
    	Photo.where({album_id: self.id})
  	end
	def client
		Client.find_by({id: self.client_id})
	end

	def category
		Category.find_by({id: self.category_id})
	end
end
