require 'sinatra'
require 'haml'
require_relative "./lib/connection"
require_relative "./lib/item"

get '/' do 
  haml :index 
end 

post "/items" do 
  Item.new({
    item: params["item"]
  }).save
  "You posted to the server!" 
end 

get "/items" do 
  content_type :json
  Item.all.to_json
end 

delete "/items" do
  Item.find_by_id(params["id"]).destroy  
  "Item #{params["id"]} destroyed in db!"
end 