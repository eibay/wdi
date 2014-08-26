require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
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

get("/dorm") do 
  dorm = Dorm.all()
  erb(:index_dorm, { locals: { dorm: dorm} } )
end 

post ("/dorm") do 
  capicity = params["capicity"]
  building = params["building"]

  dorm_info = {"building" => building, :capicity => capicity}
  Dorm.create(dorm_info)
  erb(:index_dorm, { locals: { dorm: Dorm.all()} } )
  end

get ("/dorm/new") do 
  erb(:new_dorm_form)
end 

get("/dorm/:dorm") do 
  dorm_search = Dorm.find_by("building", params[:dorm])
  binding.pry
  erb(:dorm_search, {locals: { dorm: dorm_search}})
end 
