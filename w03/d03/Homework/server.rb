require 'sinatra'
require 'pry'
require 'httparty'

# define variables # 

$access_token = "4ad7cc36c172434588afd340aa74cd01"  

def tagged so
	url = "https://api.instagram.com/v1/tags/#{so}/media/recent?client_id=#{$access_token}"
	results = HTTParty.get url 
	results["data"].map do |result|
		result["images"]["standard_resolution"]["url"]
	end 
end

# main app # 
 
get '/' do
	erb :index 
end

get "/tags" do 
	t = request.params["tag"]
	imgs = tagged t
	erb :tags, {locals: {imgs: imgs }} 
end 

get "/cities" do 
	c = request.params["city"]
	erb :cities  
end