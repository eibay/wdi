require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/cars_mechanics.rb'


get '/'  do
	erb(:index)
end

get '/mechanics' do
	erb(:mechanics, {locals: {mechanics: Mechanics.all()}})
end


post '/mechanics' do
	name = params["name"].downcase
	age = params["age"]
	favorite_car= params["favorite"].downcase
	mechanic = {"name" => name, "age" => age, "favorite" => favorite_car}

	Mechanics.add(mechanic)

	erb(:mechanics, {locals: {mechanics: Mechanics.all()}})

end


get '/mechanics/search' do

	mechanics = Mechanics.search("name", params["name"])
	binding.pry
	erb(:mechanics_results, {locals: {mechanics: mechanics}})
end




get '/cars' do
	erb(:cars, {locals: {cars: Cars.all()}})
end


post '/cars' do

	make = params["make"].downcase
	model = params["model"].downcase
	color= params["color"].downcase
	car = {"make" => make, "model" => model, "color" => color}

	Cars.add(car)

	erb(:cars, {locals: {cars: Cars.all()}})

end


get '/cars/search' do
binding.pry
	cars = Cars.search("make", params["make"])
	erb(:cars_results, {locals: {cars: cars}})
end


