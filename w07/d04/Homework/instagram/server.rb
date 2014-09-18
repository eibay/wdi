require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'pry'

# ruby gets the photos from instagram

get '/' do
	erb(:index)
end


get '/:tag_name' do 
tag_name = 'sunglasses'
response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag_name}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")


		photo_array = []
		# looking for photo urls in the big hash
		response["data"].each do |pic|
			photo_url = pic["images"]["standard_resolution"]["url"]
			# push each photo into this array
			photo_array << "<img src='#{photo_url}'>"
		end

	erb(:index)

end