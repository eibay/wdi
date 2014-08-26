require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './lib/car'
require_relative './lib/mechanic'

get '/' do
	
	erb(:index)
end

get '/add/car' do
	data_cars = Car.get_data()
	erb(:add_car, {locals: {data_cars: data_cars}})
end
post '/add/car' do
	data_cars = Car.get_data()
	car = {make: params["make"].capitalize, model: params["model"].capitalize, colour: params["colour"].capitalize}
	Car.add_car(car)
	erb(:add_car, {locals: {data_cars: data_cars}})
end

get '/search/car' do
	searched_car = Car.search_car(params["criteria"])
	erb(:search_car, {locals: {searched_car: searched_car}})
end




get '/add/mechanic' do
	data_mechanics = Mechanic.get_data()
	erb(:add_mechanic, {locals: {data_mechanics: data_mechanics}})
end
post '/add/mechanic' do
	data_mechanics = Mechanic.get_data()
	mechanic = {name: params["name"].capitalize, age: params["age"].capitalize, fav_car: params["fav_car"].capitalize}
	Mechanic.add_mechanic(mechanic)
	erb(:add_mechanic, {locals: {data_mechanics: data_mechanics}})
end
get '/search/mechanic' do
	searched_mechanic = Mechanic.search_mechanic(params["criteria"])
	erb(:search_mechanic, {locals: {searched_mechanic: searched_mechanic}})
end

get '/profile/mechanic/:name' do
	data_mechanics = Mechanic.get_data()
	erb(:profile_mechanic, {locals: {data_mechanics: data_mechanics}})
end
