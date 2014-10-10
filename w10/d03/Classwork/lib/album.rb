require 'active_record'

class Album < ActiveRecord::Base
		self.has_many(:photos)

		# def photos
		# 	Photo.where({ album_id: self.id })
		# end

	end