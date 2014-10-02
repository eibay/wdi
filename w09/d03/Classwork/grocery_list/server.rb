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

get '/' do 
	erb(:index)
end

get '/items' do 
	groceries = Grocery.all().order(id: :desc)
	groceries.to_json
end

post '/items' do
	content_type :json

	attributes = JSON.parse(request.body.read)

	new_item = attributes['item']
	quantity = attributes['quantity']
	new_item_hash = {
		item: new_item, 
		quantity: quantity, 
		bought: false, 
		position: Grocery.all().length
	}
	item = Grocery.create(new_item_hash)
	item.to_json
end 

delete '/items/:id' do 
	content_type :json

	item_to_delete = Grocery.find_by({id: params['id']})
	item_to_delete.destroy

end

put '/items/:id' do
	content_type :json
	attributes = JSON.parse(request.body.read)
binding.pry
	item_to_update = Grocery.find_by({id: params['id']})
	item_to_update[:quantity] = attributes['quantity']

	item_to_update.to_json
end

# get '/' do 
# 	erb(:index)
# end

# get '/items' do 
# 	content_type :json

# 	groceries = Grocery.all().order(id: :desc)
# 	groceries.to_json
# end

# post '/items' do
# 	content_type :json
# 	attributes = JSON.parse(request.body.read)

# 	new_item = attributes['item']
# 	quantity = attributes['quantity']
# 	new_item_hash = {
# 		item: new_item, 
# 		quantity: quantity, 
# 		bought: false, 
# 		position: Grocery.all().length
# 	}
# 	new_item = Grocery.create(new_item_hash)

# 	new_item.to_json
# end 

# delete '/delete' do 
# 	content_type :json

# 	id = params['toDeleteId']
# 	item_to_delete = Grocery.find_by({id: id})
# 	item_to_delete.destroy

# end

# put '/list_up' do
# 	content_type :json

# 	id = params['id']
# 	item_to_update = Grocery.find_by({id: id})
# 	new_quant = item_to_update[:quantity] + 1
# 	item_to_update[:quantity] = new_quant
# 	item_to_update.save()

# 	new_quant.to_json
# end

# put '/list_down' do
# 	content_type :json

# 	id = params['id']
# 	item_to_update = Grocery.find_by({id: id})
# 	new_quant = item_to_update[:quantity] - 1
# 	item_to_update[:quantity] = new_quant
# 	item_to_update.save()

# 	new_quant.to_json
# end

