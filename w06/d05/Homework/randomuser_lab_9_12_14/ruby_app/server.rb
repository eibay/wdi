require 'sinatra'
require 'json'
require 'httparty'
require 'haml'
require 'pry'

def random_rosencrantzers
	random_rosencrantzers_json = HTTParty.get "http://localhost:2000/users"
	JSON.parse random_rosencrantzers_json 
end 

get '/' do 
	haml :index, locals: {users: random_rosencrantzers} 
end 

post "/user" do 
	random_rosencrantzer_json = HTTParty.post "http://localhost:2000/user/create"
	random_rosencrantzer = JSON.parse random_rosencrantzer_json
	redirect "/user/#{random_rosencrantzer["user_id"]}"
end 

get "/user/:user_id" do
	random_rosencrantzer = random_rosencrantzers.find do |random_rosencrantzer|
		random_rosencrantzer["user_id"] == params[:user_id]
	end 

	haml :user, locals: {user: random_rosencrantzer} 
end 