require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require_relative '../connection'

class Item < ActiveRecord::Base
end

after do 
  ActiveRecord::Base.connection.close
end

get '/' do
  items = Item.all()
  erb(:index, {locals: {items: items}})
end


post '/add' do
  content_type :json

  i = Item.new({name: params['name'], list: "list", quantity: params['quantity']})
  i.save
  
  item = Item.last()
  item.to_json
end

delete '/delete' do
  i = Item.find_by({id: params['id']})
  i.destroy

end

put '/increase' do
  content_type :json

  i = Item.find_by({id: params['id']})
  i.update(quantity: i['quantity']+1)

  i = Item.find_by({id: params['id']})
  i.to_json
end

put '/decrease' do
  content_type :json

  i = Item.find_by({id: params['id']})
  i.update(quantity: i['quantity']-1)

  i = Item.find_by({id: params['id']})
  i.to_json
end
