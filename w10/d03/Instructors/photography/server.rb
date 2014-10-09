require 'sinatra'
require_relative 'connection'
require_relative 'models'
require 'active_support'
require 'sinatra/reloader'
require 'pry'
require 'json'

after do
  ActiveRecord::Base.connection.close
end

before do
  content_type :json
end

get('/albums') do
	albums = Album.all()
	albums.to_json
end

get('/albums/:id') do
	album = Album.find(params[:id])
	album.to_json
end

post('/albums') do
	ogs_album = Album.create({
  		title: "OG", 
 		event_date: Date.new(2015,06,01),
  		category_id: family.id,
  		client_id: pj.id
	})

	Album.post(ogs_album)
end

put('/albums/:id') do

end

delete('/albums/:id') do
	album = Album.find(params[:id])
	album.destroy
	redirect '/albums'
end

get('/albums/:id/photos') do

end