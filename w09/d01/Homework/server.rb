require 'sinatra'
require 'json'
require 'haml'

get '/' do 
  haml :app 
end 

get "/api" do 
  # send a request to Goodreads 
end