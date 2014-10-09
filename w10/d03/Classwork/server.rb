require_relative './lib/connection'
require_relative './lib/album'
require_relative './lib/client'
require_relative './lib/event'
require_relative './lib/photo'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'httparty'

get('/albums') do
	
	Album.all.to_json
end

get('/albums/:id') do
	Album.find(params[:id]).to_json(:include => :photos)
end

post('/albums') do
	content_type :json

	album = Album.create({name:params[:name], event_id:1, client_id:1})
	album.to_json
end

put('/albums/:id') do
	album = Album.find_by(id:params[:id])
  album.update(album_params(params))

  album.to_json

end

delete('/albums/:id') do
	Album.find(params[:id]).destroy
	"blah".to_json
end


get('/') do
	binding.pry
end



def album_params(params)
  params.slice(*Album.column_names)
end








