require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative "./lib/house.rb"
require_relative "./lib/student.rb"
require_relative "./lib/model.rb"

get("/") do 
	erb(:index)
end

get("/houses") do 
	houses = House.all()
	erb(:houses, {locals: {houses: houses}})
end

get("/students") do
	students = Student.all()
	erb(:students, {locals: {students: students}})
end

post("/students") do
	student = {}
	student["name"] = params["name"]
	student["image"] = params["image"]
	Student.create(student)
	students = Student.all()
	erb(:students, {locals: {students: students}})
end

get("/students/new") do
	erb(:add_new)
end

get("/students/:id") do
	student = Student.find_by("id", params[:id])
	house = student.house
	erb(:student, {locals: {student: student, house: house}})
end

get("/houses/:id") do
	house = House.find_by("id", params[:id])
	students = 