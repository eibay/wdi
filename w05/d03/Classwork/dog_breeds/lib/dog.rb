require 'active_record'

class Dog < ActiveRecord::Base
	def breed
		Breed.find_by({id: self.breed_id})
	end
end