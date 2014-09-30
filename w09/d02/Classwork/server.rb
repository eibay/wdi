require 'sinatra'
require 'haml'
require 'awesome_print'
require_relative "./lib/connection"
require_relative "./lib/item"

class String 
  def to_boolean
    self == "true"
  end
end 

get '/' do 
  haml :index
end 

post "/items" do 
  content_type :json 
  i = Item.new({
    item: params["item"],
    quanity: params["quanity"],
    completed: false 
  })
  i.save 
  i.reload.to_json
end 

get "/items" do 
  content_type :json 
  Item.all.to_json
end 

delete "/items" do
  ap params["id"] 
  ap Item.all.to_json
  Item.find_by_id(params["id"]).destroy 
  "Item #{params["id"]} destroyed in db!"
end 

put "/items" do
  i = Item.find_by_id params["id"]  
  if params["quanity"]
    Item.update params["id"], {quanity: params["quanity"]} 
  elsif params["completed"] 
    Item.update params["id"], {completed: params["completed"].to_boolean}
  end 
  i.reload.to_json 
end 