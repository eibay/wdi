require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative './lib/grocery.rb'
require_relative './connection.rb'
require 'json'
require 'pry'

get '/' do

  erb(:index, locals:{items: Grocery.all()})
end

get '/app.js' do
  js = File.read('./app.js')
  return js
end

post '/items' do
  binding.pry
  item = params.keys[0]
  Grocery.create({item: item})
  getItem = Grocery.where({item: item})[0]
  getItem = getItem.to_json
end

post '/delItems' do
  id = request.body.read
  Grocery.find(id).destroy
  erb(:index, locals:{items: Grocery.all()})
end
