require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'

require_relative './libs/connection.rb'
require_relative './libs/items.rb'

after do
  ActiveRecord::Base.connection.close
end

get "/" do
  erb(:index)
end


get "/items" do
  Item.all().to_json
end


post "/items" do
  content_type :json

  attributes = JSON.parse(request.body.read)

  item = attributes["item"]
  number = attributes["number"]
  newItem = {item: item, number:number}
  item = Item.create(newItem)
  item.to_json
end


delete "/items/:id" do
 to_delete = Item.find_by({id: params[:id]})
 to_delete.destroy
end


put "/items/:id" do
  content_type :json

  attributes = JSON.parse(request.body.read)

  item = attributes["item"]
  number = attributes["number"]

  to_edit = Item.find(params[:id])
  to_edit.update({item: item, number: number})

  to_edit.to_json
end