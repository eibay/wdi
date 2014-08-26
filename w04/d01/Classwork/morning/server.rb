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

def student(search)

get("/students/:first_name") do #dynamic path nothing in program that links :first_name
students = JSON.parse(File.read('./students.txt')) 
#result is the return value of .find
result  = students.find do |student|
  student["first"].downcase == params[:first_name].downcase #checks for truthiness
  # student["last"].downcase == params[:last_name].downcase
  # student["email"].downcase == params[:email].downcase

end

erb(:student, { locals: { student: result} })

end