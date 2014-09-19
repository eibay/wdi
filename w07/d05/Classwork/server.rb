require 'sinatra'
require 'json'
require 'haml'
require 'httparty'

get '/' do 

	haml :index 
end 