require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

<<<<<<< HEAD:w04/d01/Classwork/morning_with_methods_lw/server.rb




=======
def bark
  puts "WOOF!"
  binding.pry
end
>>>>>>> 17b90f9f77ead0a255aba292ca9c1e4d1b0b7c06:w04/d01/Instructors/morning_with_methods/server.rb

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
<<<<<<< HEAD:w04/d01/Classwork/morning_with_methods_lw/server.rb
 # The two lines below have the same result
 # students = JSON.parse(File.read('./students.txt'))
=======
  # The two lines below have the same result
  # students = JSON.parse(File.read('./students.txt'))
>>>>>>> 17b90f9f77ead0a255aba292ca9c1e4d1b0b7c06:w04/d01/Instructors/morning_with_methods/server.rb
	students = all()
  
	erb(:index, { locals: { students: students} })
end

post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  create(person)
<<<<<<< HEAD:w04/d01/Classwork/morning_with_methods_lw/server.rb

=======
>>>>>>> 17b90f9f77ead0a255aba292ca9c1e4d1b0b7c06:w04/d01/Instructors/morning_with_methods/server.rb
  # # students is an array
  # students = JSON.parse(File.read('./students.txt'))
  # # add hash to array
  # students.push(person)
  # # convert students array to JSON
  # students_json = JSON.generate(students)
  # # takes 2 args, file to write and what to write
  # File.write('./students.txt', students_json)

  students = all()

  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end

<<<<<<< HEAD:w04/d01/Classwork/morning_with_methods_lw/server.rb
=======
get("/students/:first_name") do 
  # students = JSON.parse(File.read('./students.txt'))
  # # result is the return value of .find
  # result = students.find do |student|
  #   student["first"].downcase == params[:first_name].downcase
  # end

  result = find_by("first", params[:first_name])
>>>>>>> 17b90f9f77ead0a255aba292ca9c1e4d1b0b7c06:w04/d01/Instructors/morning_with_methods/server.rb







get("/students/:first_name") do 
  # students = JSON.parse(File.read('./students.txt'))
  # # result is the return value of .find
  # result = students.find do |student|
  #   student["first"].downcase == params[:first_name].downcase
  # end
  # # binding.pry

  result = find_by("first", params[:first_name])
  erb(:student, { locals: { student: result} })
end












