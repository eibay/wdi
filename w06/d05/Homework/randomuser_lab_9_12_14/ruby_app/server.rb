require 'sinatra'
require 'json'
require 'httparty'
require 'haml'

get '/' do 

	users = [{"first_name" => "Clayton", 
		"last_name" => "Albachten"},
		{"first_name" => "Cheryl",
			"last_name" => "Wu"}
	]
	# HTTParty.get "http://localhost:2000/users" 
	haml :index, locals: {users: users} 
end 