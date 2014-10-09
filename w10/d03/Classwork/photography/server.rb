require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require_relative  './connection'
require_relative './models'

after do
  ActiveRecord::Base.connection.close
end

get "/albums" do
  Album.all.to_json
end

get "/albums/:id" do
    # binding.pry
 Album.find(params["id"]).to_json
end

post '/albums' do
    # binding.pry
    new_album = {
          title: "Fight Club"
    }

    Album.create(new_album)
    # HTTParty.post('http://127.0.0.1:4567/albums') in pry adds the obj Fight Club
end

put '/albums/:id' do
  # binding.pry
   album = Album.find(params["id"])
   album.title = "Departed"
   album.save
end

delete '/albums/:id' do
  album = Album.find(params["id"])
  album.destroy
  # HTTParty.delete('http://127.0.0.1:4567/albums/1') in pry deletes the object PJ
end

get "/albums/:id/photos" do
  # photos = Album.find(params[:id]).to_json(:include => photos)
  photos = Album.find(params[:id]).photos.to_json

end
