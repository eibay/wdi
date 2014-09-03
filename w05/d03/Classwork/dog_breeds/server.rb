require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection.rb'
require_relative './lib/dog.rb'
require 'pry'

after do
  ActiveRecord::Base.connection.close
end


get "/" do
  erb(:index, locals: {breeds: Breed.all()})
end

get "/:id" do
  breed = Breed.find_by({id: params[:id]})
  erb(:"/edit", { locals: {breed: breed}})
end

put "/:id" do
  breed_info = {name: params["breed"]}
  breed = Breed.find_by({id: params[:id]})
  breed.update(breed_info)

  redirect "/"
end
