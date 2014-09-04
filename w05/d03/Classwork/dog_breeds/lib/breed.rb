require 'httparty'
require 'json'

class Breed < ActiveRecord::Base
	def image
		name = self.name 
		pet = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=66c07067a90966f13914e96f4285f9a2&animal=dog&breed=#{name}&format=json&output=basic")
		image_url = pet["petfinder"]["pet"]["media"]["photos"]["photo"][3]["$t"] 
		Image.create({url: image_url, breed_id: self.id})
		return image_url
	end
end