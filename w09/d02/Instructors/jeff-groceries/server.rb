require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './db/connection'
require_relative './db/item'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb(:index)
end

get '/items' do
  content_type :json

  Item.all.to_json
end

post '/items' do
  content_type :json

  item = Item.create(name: params[:name])

  item.to_json
end

delete '/items/:id' do
  item = Item.find(params[:id])
  item.destroy
end