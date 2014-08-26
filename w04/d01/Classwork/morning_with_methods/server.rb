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
  return File.write('./students.txt', students.to_json)
end

def find_by(key, value)
  all().find do |student|
  return student[key].downcase == value.downcase
  end
end
#can connect methods

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
  students = all()
  #because we only set value of students in a method and a method 
  #has its values it in and that is where they are
  #make sure locals are in this methdod!! that they can be seen!
  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end

get("/students/:first_name") do 
  result = find_by("first", params[:first_name])
   erb(:student, { locals: { student: result} })
end












