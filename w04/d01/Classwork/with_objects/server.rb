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

  erb(:index, {locals: { students: Student.all() } })
end

post("/dorms") do
  name = params["name"]
  capacity = params["capacity"]
  street_address = params["street_address"]

  dorm = {"name" => name, "capacity" => capacity, "street_address" => street_address}

  Dorm.create(dorm)

  erb(:index, {locals: { dorm: Dorm.all(), students: Student.all() } })
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