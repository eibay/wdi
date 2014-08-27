require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
require_relative './lib/dorm'

get("/") do  
	erb(:index)
end

post("/students") do
  student = {"first" => params["first"], "last" => params["last"], "email" => params["email"]}

  Student.create(student)

  erb(:students, { locals: { students: Student.all() } })
end

get("/students") do
  erb(:students, { locals: { students: Student.all() } })
end

get("/students/new") do
	erb(:new_student)
end

get("/students/:first_name") do 
  student = Student.find_by("first", params[:first_name])

  erb(:student, { locals: { student: student } })
end

get ("/students/search_results")
  student = Student.select_by(params["search_type"], params["keyword"])
  erb(:student, {locals: {student: student }})




get("/dorms/new") do
  erb(:new_dorm)
end

get("/dorms/:name") do
  dorm = Dorm.find_by("name", params[:name])

  erb(:dorm, { locals: { dorm: dorm } })
end

post("/dorms") do
  dorm = { name: params["name"], capacity: params["capacity"] }

  Dorm.create(dorm)

  erb(:dorms, { locals: { dorms: Dorm.all() } })
end

get("/dorms") do
  erb(:dorms, { locals: { dorms: Dorm.all() } })
end