require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'uri'
require './lib/classes.rb'

get "/" do
	erb(:index)
end

get "/cars/show" do

	list = Cars.all
	techs = Mechanics.all.collect {|hash| hash["name"]}

	erb(:show_cars, locals: {list: list, techs: techs})
end


get "/cars/add" do
	erb(:add_cars)
end

get "/cars/search" do
	erb(:search_cars)
end

get "/cars/search/:type" do
	hits = Cars.find_all_by(params["type"], params["term"].downcase)
	list = []
	hits.each {|hash| list << "#{hash["make"]} #{hash["model"]}, #{hash["color"]}"}
	erb(:results, locals: {list: list, search: "car", strain: params["type"]})
end

get "/mechanics/show" do

	list = Mechanics.all

	erb(:show_mechanics, locals: {list: list})
end

get "/mechanics/add" do
	erb(:add_mechanics)
end

get "/mechanics/search" do
	erb(:search_mechanics)
end

get "/mechanics/search/:type" do
	hits = Mechanics.find_all_by(params["type"], params["term"].downcase)
	list = []
	hits.each {|hash| list << "#{hash["name"]}, #{hash["age"]}; Favorite Car: #{hash["car"]}"}
	erb(:results, locals: {list: list, search: "mechanic", strain: params["type"]})
end

post "/cars/add" do
	car = {}
	params.each {|key, value| car[key] = value}
	car["mechanic"] = "none"
	Cars.create(car)
	list = Cars.all
	techs = Mechanics.all.collect {|hash| hash["name"]}

	erb(:show_cars, locals: {list: list, techs: techs})
end

post "/mechanics/add" do
	mechanic = {}
	params.each {|key, value| mechanic[key] = value}

	Mechanics.create(mechanic)
	list = Mechanics.all
	erb(:show_mechanics, locals: {list: list})
end

post "/mechanics/add/random" do
	5.times{Mechanics.add_random}
	erb(:show_mechanics, locals: {list: Mechanics.all})
end

get "/cars/:model" do
	erb(:car, locals: {car: Cars.find_by("model", params["model"]) })
end

get "/mechanics/:name" do
	erb(:mechanic, locals: {mechanic: Mechanics.find_by("name", params["name"]) })
end

post "/cars/mechanic/" do

	list = Cars.all.each {|hash| hash["mechanic"] = params["mechanic"] if hash["model"] == params["model"]}
	json_list = JSON.generate(list)
	File.write("./cars.txt", json_list)
	techs = Mechanics.all.collect {|tech| tech["name"]}

	erb(:show_cars, locals: {list: list, techs: techs })
	

end








