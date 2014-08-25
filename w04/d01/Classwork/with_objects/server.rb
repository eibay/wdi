require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/classes'

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

  erb(:student_page, {locals: { students: Student.all() } })
end

get("/students/new") do
	erb(:new_student)
end

get("/students/:first_name") do 
  student = Student.find_by("first", params[:first_name])

  erb(:student, { locals: { student: result} })
end

get("/students") do
  erb(:student_page, {local: { students: Student.all() }})
end

post("/dorms") do
  dorm_name = params["dorm"]
  capacity = params["capacity"]

  dorm_choice = {"dorm" => dorm_name, "capacity" => capacity}

  Dorm.create(dorm_choice)

  erb(:dorm_page, {locals: { dorms: Dorm.all() } })
end

get("/dorms/new") do
  erb(:new_dorm)
end

get("/dorms") do 
  erb(:dorm_page, {local: { dorms: Dorm.all() }})
end















