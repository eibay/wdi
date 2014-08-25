require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'

get("/") do
	students = Student.all()
  
	erb(:index, { locals: { students: students} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  Student.create(person)

  erb(:index, {locals: { students: Student.all() } })
end

get("/students/new") do
	erb(:new_student)
end

get("/students/:first_name") do 
  student = Student.find_by("first", params[:first_name])

  erb(:student, { locals: { student: result} })
end

get("/dorms") do
  dorms = Dorm.all()
  
  erb(:dorms, { locals: { dorms: dorms } })
end


post("/dorms") do
  dorm_name = params["dorm_name"]
  capacity = params["capacity"]

  dorm_info = {"dorm_name" => dorm_name, "capacity" => capacity}

  Dorm.create(dorm_info)
  dorms = Dorm.all()
  erb(:dorms, { locals: { dorms: dorms } })
end


get("/dorms/new") do
  erb(:new_dorm)
end

get("/dorms/:dorm_name") do 
  dorm = Dorm.find_by("dorm_name", params[:dorm_name])

  erb(:dorm, { locals: { dorm: dorm} })
end