require 'sinatra'
require 'haml'
require 'awesome_print'
require_relative "./lib/connection"
require_relative "./lib/item"

get '/' do 

  haml :index 
end 

post "/items" do 

  Item.new(
    {item: params["item"]}
  ).save 

  "You posted to the server!" 
end 

get "/items" do 
  content_type :json

  Item.all.to_json  
end 