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

  erb(:index, {locals: { students: Student.all(), dorms: Dorm.all() } })
end

post("/dorms") do
  dormitory = {"name" => params["name"], "capacity" => params["capacity"]}
  Dorm.create(dormitory)
  erb(:index, {locals: { students: Student.all(), dorms: Dorm.all } })
end

get("/new_entry") do
	erb(:new_entry)
end

get("/students/:first_name") do 
  student = Student.find_by("first", params[:first_name])

  erb(:student, { locals: { student: result} })
end

get("/dorms/:name") do
  result = Dorm.find_by("name", params["name"])
  erb(:dorm, {locals: {result: result}})
end