require 'pry'
require 'sinatra'
require 'json'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/client'
require_relative './lib/photo'
require_relative './lib/album'
require_relative './lib/category'

after do 
	ActiveRecord::Base.connection.close
end

get "/albums" do
	album = Album.all()
	album.to_json
end

get "/albums/:id" do

	album = Album.find(params[:id])
	album.to_json
end

post "/albums" do
	album_hash = {
		title: params[:title],
		client_id: params[:client_id],
		category_id: params[:category_id],
		event_date: params[:event_date]
	}

	new_album = Album.create(album_hash)
	# new_album.to_json
end

get "/albums/:id/photos" do
	album = Album.find(params[:id])
	photos = album.photos
	photos.to_json

end

delete "/albums/:id" do
	content_type :json
	album = Album.find(params[:id])
	album.destroy
end
