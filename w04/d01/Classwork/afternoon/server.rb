require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
require_relative './lib/dorms'

get("/") do
	students = Student.all()
  dorms = Dorms.all()
  
	erb(:index, { locals: { students: students, dorms: dorms} } )
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  Student.create(person)

  erb(:index, {locals: { students: Student.all() } })
end

post("/dorms") do
  dorm_name = params["name"]
  dorm_capacity = params["capacity"]

  dorm = { "name" => dorm_name, "capacity" => dorm_capacity}

  Dorms.create(dorm)

erb(:index_dorms, {locals: {dorms: Dorms.all() } }) 
end


get("/students/new") do
	erb(:new_student)
end

get("/dorms/new") do
  erb(:new_dorm)
end

get("/students/:first_name") do 
  student = Student.find_by("first", params[:first_name])
  erb(:student, { locals: { student: student} })
end

get("/dorms/:dorm_name") do
  dorm = Dorms.find_by("name", params[:dorm_name])

  erb(:dorms, {locals: {dorm: dorm} })
end