require 'sinatra'
require 'sinatra/reloader'
require 'date'
require_relative './db/connection'
require_relative './lib/album'
require_relative './lib/category'
require_relative './lib/client'
require_relative './lib/photo'
require 'httparty'
require 'pry'

after do
  ActiveRecord::Base.connection.close
end

get "/albums" do 
	binding.pry
	Album.all.to_json
end

get "/albums/:id" do
	
	album = Album.find(params["id"]).to_json
end

post "/albums" do
	new_album = {
		title: "Weekend at Hodor's",
		event_date: Time.now
	}
	Album.create(new_album)
end

put "/albums/:id" do
	
	album = Album.find(params["id"])
	album.title = "Sunday Funday"
	album.save
end

delete "/albums/:id" do
	album = Album.find(params["id"])
	album.destroy
	album.to_json
end

get "/albums/:id/photos" do

	photos = Album.find(params[:id]).photos.to_json
	
end

post "/photos" do 

end

get "/clients" do 
end

get "/clients/:id/albums" do 
end






