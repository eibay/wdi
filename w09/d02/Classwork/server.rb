require 'sinatra'
require 'haml'
require 'awesome_print'
require_relative "./lib/connection"
require_relative "./lib/item"

get '/' do 

  haml :index 
end 

post "/items" do 

  ap params["item"]

  "You posted to the server!" 
end 