require 'sinatra'
require 'sinatra/reloader'
require 'pry'


require_relative './lib/mechanic'
require_relative './lib/cars'

get ("/") do
  erb(:index) 
end

get("/car") do
  cars = Cars.list()
  erb(:car, {locals: {cars: cars}})
end


get("/mechanic") do
  
  mechanics = Mechanic.list()

  erb(:mechanic, {locals: {mechanics: mechanics}})
end

get("/add/car") do
  erb(:caradd)
end

get("/add/mechanic") do
  erb(:mechanicadd)
end

post("/car") do
  make = params["make"]
  model = params["model"]
  color = params["color"]
  car = {"make" => make, "model"=> model, "color"=> color}
  Cars.hashlist(car)
  cars = Cars.list()
  erb(:car, {locals: {cars: cars}})
end
 

post("/mechanic") do
  name = params["name"]
  age = params["age"]
  fav = params["favorite"]
  mechanic = {"name" => name, "age" => age, "fav"=> fav}
  Mechanic.hashlist(mechanic)
  mechanics = Mechanic.list()
  erb(:mechanic, {locals: {mechanics: mechanics}})
end

get("/search/car") do
  erb(:carsearch)
end
get("/search/mechanic") do
  erb(:mechanicsearch)
end

get("/results/car") do
  if params["make"] != nil
    search= params["make"].downcase
    searchingfor = params["word"].downcase
    results = Cars.find_by(search, searchingfor)
  elsif params["model"] != nil
    search= params["model"].downcase     
    searchingfor = params["word"].downcase
    results = Cars.find_by(search, searchingfor)
  end
    erb(:carresults,{locals: {results:results}})
  end

get('/results/mechanic') do
 if params["name"] != nil
    search= params["name"].downcase
    searchingfor = params["word"].downcase
    results = Mechanic.find_by(search, searchingfor)
  elsif params["fav"] != nil
    search= params["fav"].downcase     
    searchingfor = params["word"].downcase
    results = Mechanic.find_by(search, searchingfor)
  end
  erb(:mechanicresults,{locals: {results:results}})
  end

  get('/car/:model') do
    cars = Cars.list
    erb(:specificcar, {locals: {cars: cars}})
  end


  get('/mechanic/:name') do
    mechanics = Mechanic.list
    erb(:specificmechanic, {locals: {mechanics: mechanics}})
  end





