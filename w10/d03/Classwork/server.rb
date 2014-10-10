require "sinatra"
require "sinatra/reloader"
require_relative "connection"
require_relative "classes"
require "json"
require "pry"

get ("/albums") do
	album = Album.all
	album.to_json
end

get ("/albums/:id") do 
	id = params["id"]
	album = Album.find(id)
end 

post ("/albums") do 

	# album_parameters = request.body.read
	# album_parameters = JSON.parse(album_parameters_injson)
	Album.create(params)

end 

put ("/albums/:id") do 
	id = params["id"]
	album = Album.find(id)
	# album_parameters_injson = request.body.read
	# album_parameters = JSON.parse(album_parameters_injson)
	client_id = params["client_id"]
	category_id = params["category_id"]
	title = params["title"]

	album.update({client_id: client_id, category_id: category_id, title: title})
end 

delete ("/albums/:id") do 
	id = params["id"]
	album = Album.find(id)
	album.destroy()
end 

get ("/albums/:id/photos") do 

	album = Album.find(params["id"])
	a = album.photos
	a.to_json
end 




