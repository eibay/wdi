require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
require_relative './lib/dorms'

get("/") do
	students = Student.all()
  dorms = Dorm.all() # added dorm class stuff on this line

	erb(:index, { locals: { students: students, dorms: dorms} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  Student.create(person)

  erb(:index, {locals: { students: Student.all(), dorms: Dorm.all() } })

end

get("/students/new") do
	erb(:new_student)
end

get("/students/:first_name") do
  result = Student.find_by("first", params[:first_name])

  erb(:student, { locals: { student: result} })
end

# <h1> <%="#{student["first"]} #{student["last"]}" %> </h1>
#   <h3> Email: <%= student["email"] %> </h3>

## Dorm class paths ##

post("/dorms") do
  dorm_name = params["name"]
  dorm_capacity = params["capacity"]

  dorm = {"name" => dorm_name, "capacity" => dorm_capacity}

  Dorm.create(dorm)

   erb(:index, {locals: { dorms: Dorm.all(), students: Student.all()} })

end

get("/dorms/new") do
  erb(:new_dorm)
end

get("/dorms/:dorm_name") do
  result = Dorm.find_by("name", params[:dorm_name])

  erb(:dorm, { locals: {dorm: result}})

end

get("/dorms/:dorm_capacity") do
  result = Dorm.find_by("capacity", params[:dorm_capacity])

  erb(:dorm, { locals: {dorm: result}})

end
