require 'sinatra'
require 'json'
require 'pry'
require 'sinatra/reloader'
require_relative './lib/mechanic'
require_relative './lib/car'

get('/') do
	erb(:index)
end

post('/mechanic') do
	list = []

	mechanic = { "name" => params["name"], "age" => params["age"], "favorite_car" => params["favorite_car"]}

	Mechanic.create(mechanic)

	erb(:mechanics, { locals: { info: Mechanic.all() }})
end

get('/search/name') do
	list = []
	Mechanic.all()
	Mechanic.find_by(name, params["name"])	

	list << result

	erb(:search, { locals: { info: list } })
end

get('/search/favorite_car') do
	list = []

	Mechanic.all()
	Mechanic.find_by(favorite_car, params["favorite_car"])

	list << result

	erb(:search, { locals: { info: list } })
end

post('/car') do
	list = []

	car = { "make" => params["make"], "model" => params["model"], "color" => params["color"]}

	Car.create(car)

	erb(:cars, { locals: { info: Car.all() }})
end

get('/search/make') do
	list = []
	Car.all()
	Car.find_by(make, params[make])

	list << result

	erb(:search, { locals: { info: list } })
end

get('/search/model') do
	list = []

	Car.all()
	Car.find_by(model, params["model"])

	list << result

	erb(:search, { locals: { info: list } })
end







