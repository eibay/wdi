require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'connection.rb'
require 'pry'

class Item < ActiveRecord::Base
end

after do 
  ActiveRecord::Base.connection.close
end

get '/' do
  items = Item.all()

  erb(:index, {locals: {items: items }})
end


post '/add' do
  name = params['item']

  quantity = params['quantity']
  i = Item.new({name: name, list: "list", quantity: quantity})
  i.save


end

delete '/delete' do
  to_delete = params["id"]

  i = Item.find_by({id: to_delete})
  i.destroy


end