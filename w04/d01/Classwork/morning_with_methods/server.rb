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
    student[key].downcase == value.downcase
  end
end

get("/") do
 # students = all() <== you can either put all() in the erb thing below, or assign all() to a variable and use the variable in the erb (to make your code clearer)
	erb(:index, { locals: { students: all()} })
end


post("/students") do
  
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]
  person = {"first" => first_name, "last" => last_name, "email" => email}
  create(person) #using the create method here
  students = all()
  erb(:index, {locals: { students: all() } })
end

get("/students") do
	erb(:students)
end

get("/students/:first_name") do 
  result = find_by("first", params[:first_name])

  # students = JSON.parse(File.read('./students.txt'))
  # # result is the return value of .find
  # result = students.find do |student|
  #   student["first"].downcase == params[:first_name].downcase
  # end
  # binding.pry

  erb(:student, { locals: { student: result} })
end












