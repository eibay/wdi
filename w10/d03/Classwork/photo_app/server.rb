require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require_relative './connection'
require_relative './photo'
require_relative './album'
require_relative './category'
require_relative './client'

after do
  ActiveRecord::Base.connection.close
end

get '/albums' do
  Album.all.to_json
end

get '/albums/:id' do
  Album.all.find_by({id: params['id']}).to_json
end

post '/albums' do
  a = request.body.read
  last_id = Album.all.last.id
  rand_cat_id = Category.all.shuffle.first.id
  rand_client_id = Client.all.shuffle.first.id
  time_now = Time.now
  Album.create({name: "album_#{last_id+1}", category_id: rand_cat_id, client_id: rand_client_id} )
end

put '/albums/:id' do
  a = request.body.read
  last_id = Album.all.last.id
  to_update = Album.all.find_by({id: params['id']})

  to_update.update({name: "octopus was here!#{last_id+1}"})
end

delete '/albums/:id' do
  to_delete = Album.all.find_by({id: params['id']})
  to_delete.destroy
end

get '/albums/:id/photos' do 

  photos = Album.find(params[:id]).photos.to_json
  # Find the album

  # then calls a photos() method that searches each Photo item in 
  ## the photos database that have the album_id equivalent to this album
  ### and uses the self.has_many(:photos) in the album
end

# class Album < ActiveRecord::Base
#   # def photos
#   #   Photo.where({album_id: self.id})
#   # end  ------------------------------ either make this method
#   def category
#     Category.find_by({id: category_id})
#   end
#   def client 
#     Client.find_by({id: client_id})
#   end

#   self.has_many(:photos) ----------------- or give this property


# end

