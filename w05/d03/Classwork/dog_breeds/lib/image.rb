require 'active_record'

class Image < ActiveRecord::Base
	def image
		Image.where({breed_id: self.id})
	end
end