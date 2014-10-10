require 'sinatra'
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


get "/gettingitems" do
  Item.all().to_json
end


post "/add" do
  item = params[:item]
  number = (params[:number]).to_i
  newItem = {item: item, number:number}
  Item.create(newItem)
  data = (Item.last.id).to_json
end


delete "/delete" do
 item = params[:deleting]
 to_delete = Item.find_by({id: item})
 to_delete.destroy
end


put "/edit" do
  item = params[:editing]
  number = (params[:number]).to_i
  to_edit = Item.find_by({id: item})
  newVersion = {item: to_edit.item, number: number}
  to_edit.update(newVersion)

end