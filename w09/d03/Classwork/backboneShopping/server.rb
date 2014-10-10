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

get "/items" do
	content_type(:json)
	ListItem.order(:id).to_json
end

post "/items" do
	content_type(:json)
	package = JSON.parse(request.body.read)
	item = ListItem.create({product: package["product"], checked: false, quantity: package["quantity"].to_i})
	item.to_json
end

delete "/items/:id" do
	ListItem.delete(ListItem.find_by( { id: params["id"] } ))
	[200]
end

put "/items/:id" do
	content_type(:json)
	package = JSON.parse(request.body.read)

	item = ListItem.find_by({ id: package["id"] })
	item.update({ quantity: package["quantity"].to_i, checked: package["checked"] })
	item
end
