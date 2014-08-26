require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative './lib/methods'

get "/" do

	erb(:index)
	
end

get "/mechanics/new" do

	erb(:add_mechanic)
end

post "/mechanics" do
	name=params[:name]
	age=params[:age]
	favorite_car=params[:favorite]
	mechanic={"name" => name , "age" => age , "favorite_car" => favorite_car}
	Mechanic.create(mechanic)
	erb(:mechanics, {locals:{mechanics: Mechanic.all()}})
end

get "/mechanics" do
	erb(:mechanics, {locals:{mechanics: Mechanic.all()}})
end

get "/mechanic/:name" do
	name=params[:name]
	mechanic=Mechanic.find_by("name" , name )
	erb(:mechanic_search , {locals:{mechanic: mechanic}})
end


get "/cars/new" do
	erb(:add_car)
end
post "/cars" do
	make=params[:make]
	model=params[:model]
	color=params[:color]
	car={"make" => make , "model" => model , "color" => color ,  "mechanic" => " "}
	Car.create(car)
	erb(:cars, {locals:{cars: Car.all}})
end
get "/cars" do
	erb(:cars, {locals:{cars: Car.all}})
end

get "/car/:model" do
	model=params[:model]
	car=Car.find_by("model", model)
	erb(:individual_car, {locals:{car: car}})
end

post "/mechanic_search" do
	search=params[:search]
	mechanic=Mechanic.find_by("name" , search )|| Mechanic.find_by("favorite_car" , search)
	erb(:mechanic_search , {locals:{mechanic: mechanic}})
end

post "/car_search" do
	search=params[:search]
	cars=Car.find_by("make", search)||Car.find_by("model" , search)
	erb(:car_search, {locals:{cars: cars}})

	
end


post "/random_mechanic" do

amount=params[:how_many].to_i

  Mechanic.new_mechanic(amount)

redirect "/mechanics"
end





