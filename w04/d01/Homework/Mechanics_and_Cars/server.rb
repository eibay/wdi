require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative "./lib/car"
require_relative "./lib/mechanic"

get("/") do  
	erb(:index)
end

get("/all_cars") do
	cars = Car.full_array()
	erb(:all_cars, {locals: {cars: cars}})
end

post("/all_cars") do
	car = {"make" => params["make"], "model" => params["model"], "color" => params["color"]}
	Car.add(car)
	cars = Car.full_array()
	erb(:all_cars, {locals: {cars: cars}})
end

get("/all_mechanics") do
	mechanics = Mechanic.full_array()
	erb(:all_mechanics, {locals: {mechanics: mechanics}})
end

post("/all_mechanics") do
	mechanic = {"name" => params["name"], "age" => params["age"], "fave_car" => params["fave_car"]}
	Mechanic.add(mechanic)
	mechanics = Mechanic.full_array()
	erb(:all_mechanics, {locals: {mechanics: mechanics}})
end

get("/add") do
	erb(:add_new)
end

get("/search") do
	erb(:search)
end

get("/search_results") do
	if params["search_type"] == "car"
		if params["keyword_type"] == "make"
			results = Car.search("make", params["search_word"])
			erb(:results_page, {locals: {results: results}})
		else
			results = Car.search("model", params["search_word"])
			erb(:results_page, {locals: {results: results}})
		end
	else
		if params["keyword_type"] == "name"
			results = Mechanic.search("name", params["search_word"])
			erb(:results_page, {locals: {results: results}})
		else
			results = Mechanic.search("fave_car", params["search_word"])
			erb(:results_page, {locals: {results: results}})
		end
	end
end

get("/car/:model") do
	car = Car.individual_result("model", params[:model])
	erb(:individual_car, {locals: {car: car}})
end

get("/mechanic/:name") do
	mechanic = Mechanic.individual_result("name", params[:name])
	
	erb(:individual_mechanic, {locals: {mechanic: mechanic}})
end













