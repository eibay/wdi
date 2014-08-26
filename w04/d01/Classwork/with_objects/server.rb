require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/campus'

get("/") do
	students = Campus.all('./students.txt')

	erb(:index, { locals: { students: students} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  Campus.create(person)

  erb(:index, {locals: { students: Campus.all('./students.txt') } })
end

get("/students/new") do
	erb(:new_student)
end

get("/students/:first_name") do
  student = Campus.find_by("first", params[:first_name])

  erb(:student, { locals: { student: result} })
end

get("/dorms") do
	dorms = Campus.all('./dorms.txt')


	erb(:dorms, { locals: { dorms: dorms}})
end

get("/dorms/new") do
	dorms = Campus.all('./dorms.txt')
	# params["name"] = name
	# params["capacity"] = capacity

	# dorm_hash = {name: name, capacity: capacity}

	# Campus.create(dorm_hash)

	# erb(:new_dorms, { locals: { dorms: dorms}, name: name, capacity: capacity})
		erb(:new_dorms, { locals: {dorms: dorms}})
end

post("/dorms/new") do
	dorms = Campus.all('./dorms.txt')
	name = params["name"]
	capacity = params["capacity"]

	dorm_hash = {name: name, capacity: capacity}
	Campus.create(dorm_hash)

	erb(:new_dorms, { locals: { dorms: dorms}, name: name, capacity: capacity})
end
