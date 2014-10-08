require "active_record"
require_relative "./connection"

class Album < ActiveRecord::Base

	def photos
		Photos.where( {album_id: self.id})
	end

end