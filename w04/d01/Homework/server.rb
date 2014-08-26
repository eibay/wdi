require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './lib/objects.rb'

get('/') do 
	erb(:main, {locals: { mechanics: Mech.all(), cars: Car.all() }})
end

get('/mech_enter') do 
	erb(:mech_add)
end

post('/mechanics') do
	mech_hash = {"name" => params["name"], "age" => params["age"], "fav_car" => params["fav_car"] }

	mechanics = Mech.create(mech_hash)

	erb(:mech_page, {locals: { mechanics: Mech.all() }})
end

get('/mechanics') do
	erb(:mech_page, {locals: { mechanics: Mech.all() }})
end

get('/mechanic_search') do	 
	data_type = params["data_type"]
	data = params["data"]
	mechanics = Mech.all()

	if data_type == "name"
		mechanic = Mech.find_by("name", data)
	elsif data_type == "fav_car"
		mechanic = Mech.find_by("fav_car", data)
	end

	erb(:mech_search, {locals: { mechanic: mechanic, data: data}})
end	

get('/mechanic/:hodor') do 
	mechanics = Mech.all()
	name = params["hodor"]

	mechanic = Mech.find_by("name", name)
	erb(:mech_view, {locals: { mechanic: mechanic}})
end


#---------->>>>>CARS<<<<<----------

get('/car_enter') do 
	erb(:car_add)
end

post('/cars') do 
	car_hash = {"make" => params["make"], "model" => params["model"], "color" => params["color"]}

	cars = Car.create(car_hash)
	erb(:car_page, {locals: { cars: Car.all() }})
end

get('/cars') do 
	erb(:car_page, {locals: { cars: Car.all() }})
end

get('/car_search') do	 
	data_type = params["data_type"]
	data = params["data"]
	cars = Car.all()

	if data_type == "make"
		car = Car.find_by("make", data)
	elsif data_type == "model"
		car = Car.find_by("model", data)
	end
	erb(:car_search, {locals: { car: car, data: data}})
end	

get('/car/:hodor') do 
	cars = Car.all()
	make = params["hodor"]

	car = Car.find_by("make", make)
	erb(:car_view, {locals: { car: car}})
end
