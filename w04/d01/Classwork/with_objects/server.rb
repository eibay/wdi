require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
require_relative './lib/dormitory'

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

  erb(:student, { locals: { student: result}})
end

get "/housing" do 
  dorms = Dormitory.all

  erb :dorms, { locals: {dorms: dorms}}  
end 

get "/build" do 
  erb :build 
end 

post "/housing" do 
  n, l = params["name"], params["location"]
  dorm = {"name" => n, "location" => l}  

  Dormitory.create dorm 

  redirect "/housing"
end 