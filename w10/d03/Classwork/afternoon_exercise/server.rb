require_relative "./connection.rb"
require_relative "./models.rb"
require "sinatra"
require "sinatra/reloader"
require "pry"
require "json"
require "active_support"

after do
	ActiveRecord::Base.connection.close
end

before do
	content_type :json
end

get("/albums") do 
	albums = Album.all
	albums.to_json
end

get("/albums/:id") do
	album = Album.find_by(id: params[:id])
	album.to_json
end

delete("/albums/:id") do
	album = Album.find_by(id: params[:id])
	album.destroy

	album.to_json
end

post("/albums") do	
	my_params = JSON.parse(request.body.read)

	album = Album.create({
  title: my_params[:title], 
  event_date: my_params[:event_date],
  category_id: my_params[:category_id],
  client_id: my_params[:client_id]
	})

	album.to_json
end

put("/albums") do
	my_params = JSON.parse(request.body.read)
	album = Album.update({
  title: my_params[:title], 
  event_date: my_params[:event_date],
  category_id: my_params[:category_id],
  client_id: my_params[:client_id]
	})

	album.to_json
end

get("/albums/:id/photos") do
	album = Album.find(params[:id])
	# binding.pry
	photos = album.photos
	photos.to_json
end





