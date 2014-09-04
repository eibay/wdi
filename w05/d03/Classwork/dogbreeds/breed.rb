# require "httparty"
require "active_record"
require_relative "./connection"


class Breed < ActiveRecord::Base


	# def self.extract_url(breed)
	# 	url = false
	# 	until url
	# 		response = HTTParty.get("http://api.petfinder.com/pet.find?key=5a05c4518c406f394cc14bfbfb239214&animal=dog&location=11226&count=1000&format=json")
	# 		array = response["petfinder"]["pets"]["pet"]
	# 		binding.pry
	# 		array.each do |profile|
	# 			breed_entry = profile["breeds"]["breed"]
	# 			if breed_entry.class == Hash && breed_entry["$t"] == breed
	# 				return profile["media"]["photos"]["photo"][2]["$t"]
	# 				url = true
	# 			end
	# 		end
	# 	end
	# end




end
