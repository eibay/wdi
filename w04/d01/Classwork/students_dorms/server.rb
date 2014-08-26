require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
require_relative './lib/dorm'

get("/") do
	students = Student.all()
  dorms = Dorm.all()
	erb(:index, { locals: { students: students, dorms: dorms} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  Student.create(person)

  erb(:index, {locals: { students: Student.all(), dorms: Dorms.all() } })
end

get("/students/new") do
	erb(:new_student)
end

get("/students/:first_name") do 
  student = Student.find_by("first", params[:first_name])

  erb(:student, { locals: { student: result} })
end


post("/dorms") do
  name = params["name"]
  capacity = params["capacity"]
  address = params["address"]

  place = {"name" => name, "capacity" => capacity, "address" => address}

  Dorm.create(place)

  erb(:index, {locals: { dorms: Dorm.all() , students: Student.all() }})
end

get("/dorms/new") do
  erb(:new_dorm)
end

get("/dorms/:name") do 
  dorm = Dorm.find_by("name", params[:name])

  erb(:dorm, { locals: { dorm: dorm} })
end