require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'HTTParty'
require_relative './lib/connection.rb'
require_relative './lib/breeds.rb'

after do
  ActiveRecord::Base.connection.close
end

get "/" do
  erb(:index, {locals:{dogs:Dog.all}})
end

delete "/dog/:id" do
  deleted = Dog.find_by({id: params[:id]})
  deleted.destroy
  redirect "/"
end

get "/edit/:id" do
  dog = Dog.find_by({id: params[:id]})
  erb(:edit, {locals: {dog: dog}})
end

put "/dog/:id" do
  picture = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=23bbafb93dca18264abc62e8e888ab9c&breed=#{params[:breed]}&animal=dog&output=basic&format=json")
  editdog = {breed: params["breed"].downcase, url:(picture["petfinder"]["pet"]["media"]["photos"]["photo"][1]["$t"])}
  dog = Dog.find_by({id: params[:id]})
  dog.update(editdog)
  erb(:index, {locals: {dogs:Dog.all}})
end

post "/" do
  breed = params[:breed].downcase
  picture = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=23bbafb93dca18264abc62e8e888ab9c&breed=#{breed}&animal=dog&output=basic&format=json")
  newdog = {breed: breed, url:(picture["petfinder"]["pet"]["media"]["photos"]["photo"][1]["$t"])}
  dog = Dog.create(newdog)
  erb(:index, {locals: {dogs:Dog.all}})
end

