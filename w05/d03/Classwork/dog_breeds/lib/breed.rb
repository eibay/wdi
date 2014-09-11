require 'active_record'
require 'json'

class Breed < ActiveRecord::Base
	def to_json
		{
			"id" => self.id, 
			"name" => self.name,
			"description" => self.description
		}.to_json  
	end 
end