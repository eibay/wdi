require 'sinatra'
require 'json'
require 'httparty'
require 'haml'

get '/' do 

	haml :index
end