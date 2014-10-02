require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './connection.rb'
require_relative './models/item.rb'

after do
  ActiveRecord::Base.connection.close
end

get '/' do

erb(:index)

end


post '/add/:item' do

	content_type :json

	item = params["item"]

	newItem = Item.create({item: item, bought: false, quantity: 0})

	return newItem.to_json

end



get '/all' do

content_type :JSON

allItems = Item.all.order(id: :asc)


return allItems.to_json

end


post '/remove/:itemID' do

itemID = params['itemID'].to_i
toDelete= Item.find_by(id: itemID)

toDelete.destroy

end


post '/bought/:itemID' do

itemID = params["itemID"].to_i
toUpdate = Item.find_by(id: itemID)

	if toUpdate.bought == false
		toUpdate.update(bought: true, quantity: 0)
	else
		toUpdate.update(bought: false)
	end

end


post '/quantity/:itemID/:quantity' do

	itemID=params["itemID"].to_i
	quantity=params['quantity'].to_i

	toUpdate = Item.find_by(id: itemID)
	toUpdate.update(quantity: quantity)

end








