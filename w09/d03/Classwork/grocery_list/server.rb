require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'json'
require 'pry'

ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "joebiggica",
  :database => "grocery_list"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Grocery < ActiveRecord::Base
end

after do
  ActiveRecord::Base.connection.close
end

get '/items' do 
	erb(:main)
end

get '/groceries' do 
	content_type :json

	groceries = Grocery.all().order(id: :desc)
	groceries.to_json
end

post '/add' do
	new_item = params['item']
	quantity = params['quantity']
	new_item_hash = {
		item: new_item, 
		quantity: quantity, 
		bought: false, 
		position: Grocery.all().length
	}
	Grocery.create(new_item_hash)

	new_item_id = Grocery.all().last[:id]
	response = {id: new_item_id}
	response.to_json
end 

delete '/delete' do 
	content_type :json

	id = params['toDeleteId']
	item_to_delete = Grocery.find_by({id: id})
	item_to_delete.destroy

end

put '/list_up' do
	content_type :json

	id = params['id']
	item_to_update = Grocery.find_by({id: id})
	new_quant = item_to_update[:quantity] + 1
	item_to_update[:quantity] = new_quant
	item_to_update.save()

	new_quant.to_json
end

put '/list_down' do
	content_type :json

	id = params['id']
	item_to_update = Grocery.find_by({id: id})
	new_quant = item_to_update[:quantity] - 1
	item_to_update[:quantity] = new_quant
	item_to_update.save()

	new_quant.to_json
end

put '/list_update' do

end


