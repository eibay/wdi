require_relative '../model'
require 'json'
require 'securerandom'
require 'httparty'

class Image < Model
	def self.get_three(tag)
    	images = []
		response = HTTParty.get("https://api.instagram.com/v1/tags/tag/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
		response = response["data"]
		3.times do |i|
		images << url = response[i]['images']['standard_resolution']['url']
			i += 1
		end
		return images
	end

	def self.get(tag)
    	images = []
		response = HTTParty.get("https://api.instagram.com/v1/tags/tag/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
		response = response["data"]
		response.each do |image|
		images << url = image['images']['standard_resolution']['url']
		end
		return images
	end
end