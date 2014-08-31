require 'httparty'

class Image < ActiveRecord::Base

	def self.post(post_id)
		post = Post.find_by(id: post_id)
		post_key = post["keyword"].split(" ").join("")
		instagram = HTTParty.get("https://api.instagram.com/v1/tags/#{post_key}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2&count=3")
		images = []
		instagram["data"].each do |instagram|
			image = instagram["images"]["low_resolution"]["url"]
			images << image
		end
		images.each do |image|
			image_hash = {}
			image_hash["url"] = image 
			image_hash["post_id"] = post_id
			Image.create(image_hash)
		end	
	end

end