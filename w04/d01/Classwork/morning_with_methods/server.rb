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

  # students is an array
  students = JSON.parse(File.read('./students.txt'))
  # add hash to array
  students.push(person)
  # convert students array to JSON
  students_json = JSON.generate(students)
  # takes 2 args, file to write and what to write
  create(students_json)
  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end

get("/students/:first_name") do
  students = JSON.parse(File.read('./students.txt'))
  # result is the return value of .find
  result = students.find do |student|
    student["first"].downcase == params[:first_name].downcase
  end


  find_by(params[:first_name], student["first"])

  erb(:student, { locals: { student: result} })
end
