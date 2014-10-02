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

# post("/add_item") do 
# 	binding.pry
# 	content_type :json
# 	list_item = params["list"]
# 	quantity = params["quantity"]
# 	a = ListItem.create({item: list_item, quantity: quantity})
# 	a.to_json
# end 

# delete("/delete") do 

# 	item_to_delete = params["item"]
# 	a = ListItem.find_by(id: item_to_delete)
# 	a.destroy
# end 

# get ("/all_items") do 
# 	all_todos = ListItem.all.to_json   
# 	all_todos
# end 

# routes using backbone model 
post("/items") do 

	# content_type :json
	attributes = JSON.parse(request.body.read)
	list_item = attributes["item"]
	quantity = attributes["quantity"]
	a = ListItem.create({item: list_item, quantity: quantity})
	a.to_json
end 

delete("/items/:id") do 
	item_to_delete = params["id"]
	a = ListItem.find_by(id: item_to_delete)
	a.destroy
end 

get ("/items") do 
	all_todos = ListItem.all.to_json   
	all_todos
end 



