require 'sinatra'
require 'httparty'
require 'pry'

get("/") do 
	erb(:index)
end

get("/photos") do
	tag = request.params["tagged"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")	
	
	image_array = []
	response["data"].each do |x|
		image = x["images"]["standard_resolution"]["url"]
		image_array.push(image)
	end

	erb(:imgs, { locals: { tag: tag, image_array: image_array } })
end


# erb(:template_name, { locals: {variable_the_template_needs: "value of said variable" }})

