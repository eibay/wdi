require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def all()
  return JSON.parse(File.read('./students.txt'))
end
############################################################
# students is an array
# student is a hash
# student is being pushed into the students array
# file.write does not check if it is a hash or not

def create(student)
  students = all() #its good practice to always call your method whether you have a value or not.
  students.push(student)
  File.write('./students.txt', students.to_json)
end

############################################################
# student is a hash
# key = first name
# value = value is set to equal the first name

def find_by(key, value)
  all().find do |student|
  student[key].downcase == value.downcase # # you will need to downcase in the method to account for the user input 
  end
end

############################################################

get("/") do
  # students = JSON.parse(File.read('./students.txt')) #we can get rid of this because the line below does the same thing.
	students = all()
  
	erb(:index, { locals: { students: students} })
end

############################################################
# all the information in this post block is stuck in this block, context will be different.

post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}
  create(person)

  # # students is an array
  # students = JSON.parse(File.read('./students.txt'))
  # # add hash to array
  # students.push(person)
  # # convert students array to JSON
  # students_json = JSON.generate(students)
  # # takes 2 args, file to write and what to write
  # File.write('./students.txt', students_json)

  students = all() #need to define students as it will come up as undefine method for students.

  erb(:index, {locals: { students: students } })
end

############################################################

get("/students") do
	erb(:students)
end
############################################################

get("/students/:first_name") do 
  students = all() # calling on the def method. def method replaces students = JSON.parse(File.read('./students.txt'))

  # # students = JSON.parse(File.read('./students.txt'))
  # # result is the return value of .find
  
  # result = students.find do |student|
  # student["first"].downcase == params[:first_name].downcase
  # end

  result = find_by("first", params[:first_name]) #(see find_by method)

  erb(:student, { locals: { student: result} })
end




