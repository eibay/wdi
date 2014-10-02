require "pry"
require "sinatra"
require "sinatra/reloader"
require "json"
require_relative "./lib/ListItem"
require_relative "./connection"

after do
	ActiveRecord::Base.connection.close
end

get "/" do
	erb(:index)
end

get "/list" do
	ListItem.order(:id).to_json
end

post "/additem" do
	item = ListItem.create({name: params["item"], checked: false, quantity: params["quantity"].to_i})
	item.to_json
end

delete "/item" do
	ListItem.delete(ListItem.find_by( { id: params["id"] } ))
	[200]
end

put "/quantity" do
	item = ListItem.find_by({ id: params["id"] })
	item.update({ quantity: params["quantity"].to_i })
	item
end

# put "/items/:id" do
# 	item = ListItem.find(params[:id])

# 	item.update({ quantity: params[:quantity], checked: params[:checked]})
# end

put "/checkbox" do
	item = ListItem.find_by({ id: params["id"] })
	item.update({ checked: params["checked"] })
	item
end