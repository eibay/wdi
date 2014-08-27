require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/mechanics'
require_relative './lib/cars'

	get("/") do
		erb(:index)	
	end

	post("/mechanics") do
		mechanic = {"name" => params["name"], "age" =>params["age"], "fav_car" =>params["fav_car"]}

		Mechanic.create(mechanic)

		erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
	end

	get("/mechanics") do
		erb(:mechanics, { locals: { mechanics: Mechanic.all() } })
	end

	get("/mechanics/new") do
		erb(:new_mechanic)
	end

	get("/mechanics/:name") do
		mechanic = Mechanic.find_by("name", params[:name])

		erb(:mechanics, { locals: { mechanic: mechanic } })
	end

	get("/cars/new") do
		erb(:new_car)
	end

	get("/cars/:model") do
		model_coming_from_browser = params[:model]
		car = Car.find_by("model", model_coming_from_browser)

		erb(:car, { locals: { car: car } })
	end

	post("/cars") do
		car = { model: params["model"], make: params["make"], color: params["color"] }

		Car.create(car)

		erb(:cars, { locals: { cars: Car.all() } })
	end

	get("/cars") do
		erb(:cars, { locals: { cars: Car.all() } })
	end
	