require_relative "./lib/comment"
require_relative "./lib/connection"
require 'sinatra'
require 'json'
require 'httparty'
require 'haml'

# api methods # 

def get_random_rosencrantzers page_length, page_num 
	api_route = "http://localhost:2000/users"
	query_str = "?page_length=#{page_length}&page_num=#{page_num}"
	request = api_route + query_str 
	random_rosencrantzers_json = HTTParty.get request 
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

# api helper methods # 

class Fixnum 
	def has_next_page? 
		next_page_num = self + 1 
		next_page = get_random_rosencrantzers 5, next_page_num
		!next_page.empty? 
	end 

	def has_previous_page? 
		self > 1 
	end 
end 

# routes # 

get '/' do
	page_num = params["page_num"] ? params["page_num"].to_i : 1
	locals = {
	 	        users: get_random_rosencrantzers(5, page_num), 
	 	     page_num: page_num,
		    next_page: page_num.has_next_page?,
		previous_page: page_num.has_previous_page? 
	}   
	
	haml :index, locals: locals  
end 

post "/user" do 
	locals = {
		user: post_random_rosencrantzer, 
		comments: [] # assume a newly created user has no comments 
	}
	haml :user, locals: locals 
end 

post "/comment" do 
	Comment.new({
		user_id: params["user_id"],
		content: params["content"]
		}).save 
	
	redirect "/user/#{params["user_id"]}"
end 

get "/user/:user_id" do
	locals = {
		user: get_random_rosencrantzer(params[:user_id]), 
		comments: Comment.where(user_id: params[:user_id]) 
	} 
	haml :user, locals: locals 
end 