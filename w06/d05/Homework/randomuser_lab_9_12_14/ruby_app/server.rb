require 'sinatra'
require 'json'
require 'httparty'
require 'haml'
require 'pry'

get '/' do 

	users = [{"first_name" => "Clayton", 
		"last_name" => "Albachten"},
		{"first_name" => "Cheryl",
			"last_name" => "Wu"}
	]
	haml :index, locals: {users: users} 
end 

post "/user" do 

	random_rosencrantzer_json = HTTParty.post "http://localhost:2000/user/create"

	random_rosencrantzer = JSON.parse random_rosencrantzer_json

	redirect "/user/#{random_rosencrantzer["user_id"]}"
end 

get "/user/:user_id" do 

	

end 