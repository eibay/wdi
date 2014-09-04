require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative "./connection.rb"
require_relative "./lib/breed"
require_relative "./lib/image"
require 'pry'

after do
	ActiveRecord::Base.connection.close
end

get("/") do
	breeds = Breed.all
	erb(:index, { locals: { breeds: breeds } })
end

post("/breeds/add") do
	breed_name = {name: params[:name]}
	Breed.create(breed_name)
	breed = Breed.find_by(name: params[:name])
	breed.image
	redirect "/"
end

get("/breeds/:id/edit") do
	breed = Breed.find_by(id: params[:id])
	erb(:"breeds/edit", { locals: { breed: breed } })
end

put("/breeds/:id") do
	breed_name = {name: params[:name]}
	breed = Breed.find_by(id: params[:id]) 
	image = Image.find_by(breed_id: params[:id])
	image.destroy
	breed.update(breed_name)
	breed = Breed.find_by(name: params[:name])
	breed.image
	redirect "/"
end

delete("/breeds/:id") do
	breed = Breed.find_by(id: params[:id])
	breed.destroy
	redirect "/"
end
