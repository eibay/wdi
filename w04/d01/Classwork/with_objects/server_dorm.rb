require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/dorm'

get("/") do
	dorms = Dorm.all()
  
	erb(:index_dorms, { locals: { dorms: dorms} })
end


post("/dorms") do
  dorm_name = params["dorm_name"]
  capacity = params["capacity"]

  dorm = {"dorm_name" => dorm_name, "capacity" => capacity}

  Dorm.create(dorm)

  erb(:index_dorms, {locals: { dorms: Dorm.all() } })
end

get("/dorms/new") do
	erb(:new_dorm)
end

get("/dorms/:dorm_name") do 
  dorm = Dorm.find_by("dorm_name", params[:dorm_name])

  erb(:dorm, { locals: { dorm: dorm} })
end