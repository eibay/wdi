require_relative './model'
require 'HTTParty'

class Image < Model


	def self.instagram(hash) 
	

	tags = {"one" => hash["data"][0]["images"]["low_resolution"]["url"], "two" => hash["data"][1]["images"]["low_resolution"]["url"], "three" => hash["data"][2]["images"]["low_resolution"]["url"]}
	return tags
	end
end 