require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student' #pulls code/class/method into the file
require_relative './lib/dorm'

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

#################################################################
get("/dorms/new") do
  erb(:new_dorm)
end

post("/dorms") do
  dorm = { name: params["name"], capacity: params["capacity"] }

  Dorm.create(dorm)

  erb(:dorms, { locals: { dorms: Dorm.all() } })
end
