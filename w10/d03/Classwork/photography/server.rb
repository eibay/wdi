require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './connection.rb'
require_relative './models.rb'

after do
  ActiveRecord::Base.connection.close
end


get "/albums" do
  albums = Album.all().to_json
end

get "/albums/:id" do
  album = Album.find(params[:id]).to_json
end

post "/albums" do
  #response.body if want to do something like JSON to this!!
  album = {
    title: params[:title], 
    client_id: params[:client_id], 
    category_id: params[:category_id], 
    event_date:params[:event_date]
  }
  Album.create(album)
end

delete "/album/:id" do
  album = Album.find(params[:id])
  album.destroy
end

get "/albums/:id/photos" do
  album = Album.find(params[:id])
  pictures = album.photos.to_json
end



