require "pry"
require "httparty"




tag = "snake"

instagram_things = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8", headers: {"User-Agent" => "Httparty"})

image1 = instagram_things["data"][0]["images"]["standard_resolution"]["url"]
binding.pry
image2 = instagram_things["data"][1]["images"]["standard_resolution"]["url"]
image3 = instagram_things["data"][2]["images"]["standard_resolution"]["url"]



post("/posts/:id/images") do

	post = Post.find_by("id", params[:id])

	tag = post["keyword"]

	instagram_things = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8", headers: {"User-Agent" => "Httparty"})

	3.times do
		image_hash = {
			url: instagram_things["data"][rand(9)]["images"]["standard_resolution"]["url"],
			post_id: params[:id]
		}

		Image.create(image_hash)
	end

	erb(:images, { locals: { post: post, images: Image.all() } })
end




