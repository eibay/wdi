require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'httparty'
require_relative './lib/methods.rb' 

get ("/")  do
erb(:index)	
end

get ("/mechs") do
	mechs = Mech.parse
erb(:mechs, locals: {mechs: mechs})
end

get ("/cars") do
	cars = Car.parse
erb(:cars, locals: {cars: cars})
end

get ("/addmech") do
erb(:addmech)
end

get("/addcar") do
erb(:addcar)
end

post ("/addmech") do
	mech = {"name" => params["name"], "age" => params["age"].to_s, "car" => params["car"]}
	Mech.add(mech)
erb(:mechs, locals: {mechs: Mech.parse()})
end

post ("/addcar") do
	car = {"make" => params["make"], "model" => params["model"], "color" => params["color"]}
	Car.add(car)
erb(:cars, locals: {cars: Car.parse()})
end

get ("/mechresults") do
	mechresult = Mech.find_by(params["type"], params["search"])
	results = "<p>#{mechresult[0]["name"]} is #{mechresult[0]["age"]}, and prefers #{mechresult[0]["car"]}s.</p>"
erb(:results, locals: {results: results})
end

get ("/carresults") do
	carresult = Car.find_by(params["type"], params["search"])
	results = "<p>It looks like we found a #{carresult[0]["make"]} #{carresult[0]["model"]}; it's #{carresult[0]["color"]}.</p>"
erb(:results, locals: {results: results})
end







