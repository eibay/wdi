require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def all()
  return JSON.parse(File.read('./students.txt'))
end

def create(student)
  students = all()
  students.push(student)
  File.write('./students.txt', students.to_json)
end

def find_by(key, value)
  all().find do |student|
    student[key] == value
  end
end

get("/") do
	students = all()
  
	erb(:index, { locals: { students: students} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  create(person)

  students = all

  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end

get("/students/:first_name") do 
  
  result = find_by("first", params["first_name"].downcase.capitalize)

  erb(:student, { locals: { student: result} })
end












