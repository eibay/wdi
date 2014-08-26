require 'sinatra'
require_relative "./lib/mechanic"
require_relative "./lib/car"

get '/' do 
	erb :index 
end 

get "/mechs" do
	erb :list, {locals: {list_what: "Our Mechanics", list: Mechanic.all }}
end 

post "/mechs" do
	
	m = { "name" => params["name"], 
	"age" => params["age"],
	"favorite_car" => params["favorite_car"] } 

	Mechanic.create m 

	redirect "/mechs"
end 

get "/cars" do 

	m = params["model"]

	worker = assign_car_worker m  

	c = {"make" => params["make"], 
		"model" => m, 
		"color" => params["color"], 
		"worked_on_by" => worker }

	Car.create c 

	erb :list, {locals: {list_what: "Cars Currently Being Worked On", list: Car.all }}
end 

post "/cars" do 

	redirect "/cars"
end 
