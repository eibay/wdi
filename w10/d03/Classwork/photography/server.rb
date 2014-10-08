require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'json'

require_relative './connection'
require_relative './models'

get('/albums') do 

	Album.all.to_json

end

get('/albums/:id') do

	album = Album.find_by(id: params[:id])
	album.to_json

end

get('/albums/:id/photos') do

	album = Album.find_by(id: params[:id])
	album.photos.to_json

end 

post('/albums') do 

	album = Album.create({
			title: params["title"]
			# category_id: params["category_id"],
			# client_id: params["client_id"],
			# event_date: params["event_date"]
		})

	album.to_json

# TTParty.post("http://127.0.0.1:4567/albums", {:body => {title: "this title"}}) http://127.0.0.1:4567/albums", {:body => {title: "this title"}})


end

