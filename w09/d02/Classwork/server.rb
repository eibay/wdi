require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative './lib/grocery.rb'
require_relative './connection.rb'
require 'json'
require 'pry'

after do
  ActiveRecord::Base.connection.close
end

get '/' do

  erb(:index, locals:{items: Grocery.all()})
end

get '/allItems' do
  allItems = Grocery.all()
  allItems.to_json
end

post '/items' do
  params = JSON.parse(request.body.read)
  binding.pry
  item = params.keys[0]
  quantity = params.keys[1]
  strike = params.keys[2]

  Grocery.create({item: item, quantity: quantity, strike: strike})
  getItem = Grocery.where({item: item})[0]
  getItem = getItem.to_json
end

post '/delItems' do
  id = request.body.read
  Grocery.find(id).destroy
  erb(:index, locals:{items: Grocery.all()})
end
