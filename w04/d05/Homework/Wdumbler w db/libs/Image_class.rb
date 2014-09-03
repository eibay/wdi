require_relative './model'
require 'HTTParty'

class Image < ActiveRecord::Base


	def self.instagram(hash) 
	

	tags = {"url" => hash["data"][0]["images"]["low_resolution"]["url"]}
	return tags
	end
end 