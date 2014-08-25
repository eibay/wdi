require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
require_relative './lib/dorm'

get("/") do
	students = Student.all()

  dorms_list = JSON.parse(File.read('./dorms.txt'))

  
	erb(:index, { locals: { students: students, dorms_list: dorms_list} })
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



get ("/dorms/new") do
  erb(:dorm_new)
end

post ("/dorms/new") do

  dorm_name = params["dorm_name"]
  dorm_capacity = params["dorm_capacity"]
      # binding.pry
  dorm = Dorm.create(dorm_name, dorm_capacity)


  erb(:dorm_new, {locals: {dorm: dorm}})
end



