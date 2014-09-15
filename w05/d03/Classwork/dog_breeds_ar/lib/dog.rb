require 'active_record'

class Dog < ActiveRecord::Base
	def image
		Dog.find_by({id: self.image_id})
	end
end