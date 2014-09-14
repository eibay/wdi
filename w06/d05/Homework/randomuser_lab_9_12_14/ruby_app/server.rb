require 'sinatra'
require 'json'
require 'httparty'
require 'haml'

# api methods # 

def get_random_rosencrantzers
	api_route = "http://localhost:2000/users"
	random_rosencrantzers_json = HTTParty.get api_route
	JSON.parse random_rosencrantzers_json 
end 

def post_random_rosencrantzer 
	api_route = "http://localhost:2000/user/create"
	random_rosencrantzer_json = HTTParty.post api_route
	JSON.parse random_rosencrantzer_json
end 

def get_random_rosencrantzer id
	api_route = "http://localhost:2000/user/#{id}" 
	random_rosencrantzer_json = HTTParty.get api_route
	JSON.parse random_rosencrantzer_json
end 

# routes # 

get '/' do 
	haml :index, locals: {users: get_random_rosencrantzers} 
end 

post "/user" do 
	haml :user, locals: {user: post_random_rosencrantzer} 
end 

get "/user/:user_id" do
	haml :user, locals: {user: get_random_rosencrantzer(params[:user_id])} 
end 