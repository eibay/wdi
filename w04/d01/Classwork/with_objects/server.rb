require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'

#relative path

get("/") do
	students = Student.all()
  dorms = Dorms.all()
  #we are accessing them on students,
  #organizing our code
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

get("/students/:first_name") do 
  student = Student.find_by("first", params[:first_name])
  erb(:student, { locals: { student: result} })
end



post("/dormnames") do
dormname = params["dormname"]
capacity = params["capacity"]
dorm = {"dormname" => dormname, "capacity" => capacity}
Dorm.create(dorm)
dorms = Dorm.all
erb(:index, {locals: {dorms: dorms}})
end


get("/dorms/new") do
erb(:newdorm)
end

get ("/dorms/:name") do
dorm = Dorm.find_by("dormname", params["name"])
erb(:dormnames, {locals: {dorm:dorm}})
end














