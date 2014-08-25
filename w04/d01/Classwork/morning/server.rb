require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './methods.rb'



get("/") do
  students = JSON.parse(File.read('./students.txt'))
  erb(:index, { locals: { students: students} })

end
post("/") do
  students = JSON.parse(File.read('./students.txt'))
  student= find_by("first" , params[:search])||find_by("last" , params[:search])||find_by("email" , params[:search])
  erb(:search, {locals:{first_name: student["first"] , last_name: student["last"] , email:student["email"]}})
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

get("/students/:student") do

  students=JSON.parse(File.read('./students.txt')) 
  student= find_by("first" , params[:student])||find_by("last" , params[:student])


 erb(:student, {locals:{first_name: student["first"] , last_name: student["last"] , email:student["email"]}})

end




