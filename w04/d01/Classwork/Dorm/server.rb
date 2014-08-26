require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/dorm'

get("/") do
	dorms = Dorm.all()
  
	erb(:index, { locals: { dorms: dorms} })
end


post("/dorms") do
  dorm_name = params["name"]
  num = params["capacity"]


  dorm = {"name" => dorm_name, "capacity" => num}

  Dorm.create(dorm)

  erb(:index, {locals: { dorms: Dorm.all() } })
end

get("/dorms/new") do
	erb(:new_dorm)
end

get("/dorms/:first_name") do 
  student = Dorm.find_by("name", params[:dorm_name])

  erb(:student, { locals: { student: result} })
end