require 'sinatra'
require 'json'
require 'httparty'

# get '/:movie_title' do
	get '/:specific_word' do
	content_type :json

  	# url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
	url = URI.encode("https://api.instagram.com/v1/tags/#{params[:specific_word]}/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
  	image = HTTParty.get(url)
	image.response.body
end