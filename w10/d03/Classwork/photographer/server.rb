require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require_relative './lib/connection'
require_relative './lib/photos'
require_relative './lib/albums'
require_relative './lib/categories'
require_relative './lib/clients'

after do 
	ActiveRecord::Base.connection.close
end

get('/albums') do
	Album.all().to_json
end

get('/albums/:id') do
	Album.find(params[:id]).to_json
end

post('/albums') do 
	params = JSON.parse(request.body.read)
	album = Album.create({title: params["title"], category_id: params["category_id"], client_id: params["client_id"], event_date: params["event_date"]})
end

put('/albums/:id') do 
	album = Album.find(params[:id])
	album.update(album_params(params))

	album.to_json
end

delete('/albums/:id') do
	album = Album.find(params[:id])
	album.destroy
end

get('/albums/:id/photos') do
	photos = Album.find(params[:id]).photos
	photos.to_json 
end

def album_params(params)
  params.slice(*Album.column_names)
end