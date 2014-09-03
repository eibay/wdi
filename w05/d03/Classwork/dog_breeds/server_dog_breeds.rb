require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'httparty'
require_relative './lib/breed.rb'
require_relative './lib/connection.rb'

after do
  ActiveRecord::Base.connection.close
  # after every do, close connection. gotta close connections otherwise will be overloaded
end

get '/' do 
  list_breeds = Breed.all

  erb(:index, {locals: {list_breeds: list_breeds}})
end


post '/new' do 
  new_breed = {breed: params["breed"]}
  b = Breed.new(new_breed)
  b.save

  redirect '/'
end


delete '/breed/:id' do
  breed_to_delete = Breed.find_by({id: params[:id]})
  breed_to_delete.destroy

  redirect '/'
end

get '/edit/:id' do
  breed_to_edit = Breed.find_by({id: params[:id]})

  erb(:edit, {locals: {breed_to_edit: breed_to_edit}})
end

put '/edit/:id' do
  breed_to_edit = Breed.find_by({id: params[:id]})
  breed_change = params["breed_change"]
  breed_to_edit.breed = breed_change
  breed_to_edit.save

  redirect '/'
end




