require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
require_relative './lib/dorm'

get("/") do
  erb(:index)
end

post("/students") do
  student = {"first" => params["first"], "last" => params["last"], "email" => params["email"], "dorm_id" => params["dorm_id"]}

  Student.create(student)

  erb(:students, { locals: { students: Student.all() } })
end

get("/students") do
  erb(:students, { locals: { students: Student.all() } })
end

get("/students/new") do
  erb(:new_student, { locals: { dorms: Dorm.all() } })
end

get("/students/:id") do 
  student = Student.find_by("id", params[:id])
  dorm = Dorm.find_by("id", student["dorm_id"])

  erb(:student, { locals: { student: student, dorm: dorm } })
end





# get("/dorms/new") do
#   erb(:new_dorm)
# end

# get("/dorms/:id") do
#   dorm = Dorm.find_by("id", params[:id])
#   students_in_dorm = Student.select_by("dorm_id", dorm["id"])

#   erb(:dorm, { locals: { dorm: dorm, students: students_in_dorm } })
# end

# post("/dorms") do
#   dorm = { name: params["name"], capacity: params["capacity"] }

#   Dorm.create(dorm)

#   erb(:dorms, { locals: { dorms: Dorm.all() } })
# end

# get("/dorms") do
#   erb(:dorms, { locals: { dorms: Dorm.all() } })
# end