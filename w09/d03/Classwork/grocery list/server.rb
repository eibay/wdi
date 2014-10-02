require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative "libs/connection"
require_relative "libs/methods"


after do 
  ActiveRecord::Base.connection.close
end

get("/") do
	erb(:index, {locals: { list: ListItem.all }})
end

post("/add_item") do 
	content_type :json
	list_item = params["list"]
	a = ListItem.create({item: list_item})
	a.to_json
end 

delete("/delete") do 

	item_to_delete = params["item"]
	a = ListItem.find_by(id: item_to_delete)
	a.destroy
end 