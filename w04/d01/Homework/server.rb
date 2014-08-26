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
	mechresults = " "
	results = Mech.find_by(params["type"], params["search"])
	results.each do |x|
		mechresults += "<p>#{x["name"]} is #{x["age"]}, and prefers #{x["car"]}s.</p>"
	end
erb(:results, locals: {results: mechresults})
end

get ("/carresults") do
	carresults = " "
	results = Car.find_by(params["type"], params["search"])
	results.each do |x|
		carresults += "<p>It looks like we found a #{x["make"]} #{x["model"]}; it's #{x["color"]}.</p>"
	end
erb(:results, locals: {results: carresults})
end







