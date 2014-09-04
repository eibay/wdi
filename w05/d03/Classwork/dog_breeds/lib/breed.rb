require 'active_record'

class Breed < ActiveRecord::Base
	# def dogs
	# 	Dog.where({breed_id: self.id})
	# end

	def image
		Image.where({:image: breed.name})
	end
	
end