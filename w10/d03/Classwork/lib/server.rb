require "pry"
require "sinatra"
require "sinatra/reloader"
require "active_record"
require "json"
require_relative "./connection"

classes = {"albums" => Album, "categories" => Category, "photos" => Photo, "clients" => Client}

ActiveRecord::Base.logger = Logger.new(STDOUT)

after do
	ActiveRecord::Base.connection.close
end

get "/albums" do
	Album.all.to_json
end

get "/album/:id/:part" do
	resp = classes[params["part"]].where( {album_id: params["id"]} )
	resp.to_json
end

get "/album/:id" do
	Album.find_by( {id: params["id"]} ).to_json
end

put "/album/:id" do
	content_type(:json)

	hash = JSON.parse(request.body.read)
	album = Album.find_by( {id: params["id"]} )
	album.update(request)
	album.to_json
end

post "/album" do
	content_type(:json)

	hash = JSON.parse(request.body.read)
	album = Album.create(hash)
	album.to_json
end

delete "/album/:id" do
	album = Album.find_by( {id: params["id"]} )
	album.destroy
	[200]
end

get "/categories" do
	Category.all.to_json
end

get "/category/:id" do
	Category.find_by( {id: params["id"]} )
end

put "/category/:id" do
	content_type(:json)

	hash = JSON.parse(request.body.read)
	category = Category.find_by( {id: params["id"]} )
	category.update(hash)
	binding.pry
	category.to_json
end

get "/photos" do
	Photo.all.to_json
end
