require 'sinatra'
require 'json'
require 'httparty'
require 'haml'

get '/' do 

	haml :index
end

get '/pictures' do 
	content_type :json 
	# this route will interact w/ the ajax call 
	search = params["search"]
	city = params["city"]

	# it will return an array of strs,  
	# representing src attributes 
end 