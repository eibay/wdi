require 'sinatra'
require 'haml'
require 'awesome_print'

get '/' do 

  haml :index 
end 

post "/items" do 

  ap params["item"]

  "You posted to the server!" 
end 