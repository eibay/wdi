require 'sinatra'
require 'sinatra/reloader'
require 'pry'


require_relative './lib/student'

get("/") do
	students = Student.all()
  dorms=Dorm.all()
  
	erb(:index, { locals: { students: students , dorms: dorms} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  Student.create(person)

  redirect "/"
end

get("/students/new") do
	erb(:new_student)
end

get("/students/:first_name") do 
  student = Student.find_by("first", params[:first_name])

  erb(:student, { locals: { student: student} })
end

get("/dorms/new") do
  erb(:dorms)
end

post("/dorms") do
  name=params[:name]
  capacity=params[:capacity]
  dorm={"name"=> name , "capacity" => capacity}
  Dorm.create(dorm)
  redirect "/"
end



get("/dorms/:name") do
  dorm=Dorm.find_by("name", params[:name])

  erb(:dorm, {locals: {dorm: dorm}})

end







