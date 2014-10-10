require 'active_record'

class Client < ActiveRecord::Base
	def albums
		Album.where({client_id: self.id})
	end
end