require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/breed'
require 'pry'
require 'httparty'

after do
  ActiveRecord::Base.connection.close
end

get("/") do 
	breeds=Breed.all.order(id: :asc)

erb(:index, {locals:{breeds: breeds}})

end

post("/") do

	breeds=Breed.all
	breed=Breed.new
	breed.name=params[:name]
	breed.save
	erb(:index, {locals:{breeds: breeds}})
end
delete("/:id") do
	breed=Breed.find_by(id: params[:id])
	breed.destroy
	redirect "/"
end

get("/edit/:id") do
	breed=Breed.find_by(id: params[:id])
	erb(:edit, {locals:{breed:breed}})
end

put ("/:id") do

	breed=Breed.find_by(id: params[:id])
	breed.name=params[:name]
	breed.save
	redirect "/"
end



