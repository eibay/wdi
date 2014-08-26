require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'

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

  erb(:index, {locals: { students: Student.all() } })
end


get("/students/new") do
	erb(:new_student)
end


get("/student") do 
  student = Student.find_by("first", params[:name])

  erb(:student, { locals: { student: student} })
end


get("/dorms/new") do 
  dorms = Dorm.all()
  erb(:new_dorm, {locals: {dorms: dorms}})
end

post("/dorms") do 
  dorm_name = params["name"]
  dorm_capacity = params["capacity"]

  dorm = {"name" => dorm_name, "capacity" => dorm_capacity}
  Dorm.create(dorm)

  dorms = Dorm.all()
  students= Student.all()

  erb(:index, {locals: {dorms: dorms, students: students}})
end


get("/dorm") do 
  #binding.pry
  dorm = Dorm.find_by("name", params[:name])

  erb(:dorm, { locals: { dorm: dorm} })
end




