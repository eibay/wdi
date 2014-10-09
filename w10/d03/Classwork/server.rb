namerequire 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'json'

require_relative './models.rb'
require_relative './connection.rb'

after do
  ActiveRecord::Base.connection.close
end

before do
  content_type :json
end

get "/albums" do 
	Album.all.to_json
end

get "/albums/:id" do 
	album= Album.all.find_by(id: params[:id]).to_json
end

post "/albums" do 
	new_album = {
		title: "wayne's word",
		event_date: "2014-10-08"
	}
	Album.create(new_album)
end


new_child = {
    name: "Wayne",
}
Child.create(new_child)
end


# HTTParty.put('http://localhost:4567/albums/3')  
put "/albums/:id" do
	update_album = Album.all.find_by(id: params[:id])
	update_album.update({title: "asjhdaskjd"})
end

delete "/albums/:id" do
	album = Album.find(params[:id])
	album.destroy
	
	album.to_json
end

get "/albums/:id/photos" do
  photos = Album.find(params[:id]).to_json(:include => :photos)
    # photos = Album.find(params[:id]).photos.to_json

end