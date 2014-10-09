require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require_relative './db/connection.rb'
require_relative './lib/album.rb'
require_relative './lib/client.rb'
require_relative './lib/category.rb'
require_relative './lib/photo.rb'
require 'pry'
require 'uri'

after do
  ActiveRecord::Base.connection.close
end


get '/albums' do
  content_type :json
  all_albums = Album.all
  all_albums.to_json
end

get '/albums/:id' do
  content_type :json

  album = Album.where(id: params[:id])
  album[0].to_json
end

get '/albums/:id/photos' do

end


post '/albums' do
  content_type :json

  params = request.body.read
  params = URI.decode(params)
  hash = JSON.parse(params)

  Album.create(hash)

end

put '/albums/:id' do
  the_album = Album.find(params[:id])
  data = request.body.read


end
