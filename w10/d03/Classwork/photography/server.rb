require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './connection'
require_relative './models'

get("/albums") do 
	albums = Album.all
	albums_json = albums.to_json
	albums_json
end

get("/albums/:id") do 
	album = Album.find_by({id: params[:id]})
	album_json = album.to_json
	album_json
end

post("/albums") do 
	album_hash = {
		title: params["title"],
		event_date: date.now,
		client_id: fff,
		category_id: dfdf
	}

	Album.create(album_hash)

	new_album = album_hash.to_json
	new_album
end

get("/albums/:id/photos") do

	photosByAlbum = Album.find(params[:id]).photos

	photosByAlbum.to_json

end


