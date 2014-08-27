require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/student'
require_relative './lib/dorm'

get("/") do
  erb(:index)
end

# why isn't this path post("/students/new")
# ANSWER - because on the new_student.erb the form action="/students" and the method="POST" - this takes us back to the same route we used to add the new student to our database

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
  # we need to pass Dorm.all() to the .erb doc because it will populate our dorm drop down menu. wouldn't have thought of that :)
end


# QUESTION - how do we get to this path - since it doesn't look like we have a page to search for a student? Would this be from someone typing in the student id in the browser after /students? YES - unless we make a search page and a link to it!

get("/students/:id") do # ':' stands in place of something we're going to sub in
  student = Student.find_by("id", params[:id])
  dorm = Dorm.find_by("id", student["dorm_id"]) #we need this line to be able to display that student's particular dorm

  erb(:student, { locals: { student: student, dorm: dorm } })
end

get("/dorms/new") do
  erb(:new_dorm)
end

get("/dorms/:id") do
  dorm = Dorm.find_by("id", params[:id])
  students_in_dorm = Student.select_by("dorm_id", dorm["id"])

  erb(:dorm, { locals: { dorm: dorm, students: students_in_dorm } })
end

post("/dorms") do
  dorm = { name: params["name"], capacity: params["capacity"] }

  Dorm.create(dorm)

  erb(:dorms, { locals: { dorms: Dorm.all() } })
end

get("/dorms") do
  erb(:dorms, { locals: { dorms: Dorm.all() } })
end

