require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get("/") do
	students = JSON.parse(File.read('./students.txt'))

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
  File.write('./students.txt', students_json)

  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end

# search any specific student in the persistence layer/data
get("/students/:first_name") do  #<<<<<<<<<< using a dynamic path to see individual students
    students = JSON.parse(File.read('./students.txt'))
# student is the return value of .find    
    result = students.find do |x|
      x["first"].downcase == params["first_name"].downcase #user can type name however they want so it recognizes it
end
erb(:student, { locals: {result: result }} )
end

