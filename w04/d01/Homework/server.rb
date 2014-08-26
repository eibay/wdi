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
	result = Mechanic.all().find do |thing|
		params["name"] == thing["name"]
		end

	list << result

	erb(:search, { locals: { info: list } })
end

get('/search/favorite_car') do
	list = []

	Mechanic.all()
	result = Mechanic.all().find do |thing|
		params["favorite_car"] == thing["favorite_car"]
		end

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
	result = Car.all().find do |thing|
		params["make"] == thing["make"]
		end

	list << result

	erb(:search, { locals: { info: list } })
end

get('/search/model') do
	list = []

	Car.all()
	result = Car.all().find do |thing|
		params["model"] == thing["model"]
		end

	list << result

	erb(:search, { locals: { info: list } })
end







