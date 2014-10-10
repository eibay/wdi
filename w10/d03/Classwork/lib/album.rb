require_relative "./connection.rb"
require "active_record"

class Album < ActiveRecord::Base
	
	def pictures
		Picture.where({album_id: self.id})
	end

	def category
		Category.find_by({id: self.category_id})
	end

	def client
		Client.find_by({id: self.client})





end