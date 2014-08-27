require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student' #this allows us to access the library we created

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


# //////////////////////////////////////////

# this would get us to the page where user can create/add dorms

get("/dorms") do #this would just list the dorms
  
  dorms = Dorm.all() #Dorm in caps is the Class
  erb(:index, { locals: { dorms: dorms} })
end


post("/dorms") do #this is to add the new dorm detail to the dorm text file
  dorm_name = params["dorm_name"]
  dorm_capactiy = params["dorm_capacity"]

  dorm = {"dorm_name" => dorm_name, "dorm_capacity" => dorm_capacity}

  Dorm.create(dorm)

  erb(:index, {locals: { dorms: Dorm.all() } })
end


