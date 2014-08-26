require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def all() #() tell you it's a method
  return JSON.parse(File.read('./students.txt'))
end

def create(student) #student is a hash.  Doesn't need a hash but good to give it a hash. Doesn't check if it's a hash.
  students = all() #access student.txt files
  students.push(student) #pushes hash into the array then writes to txt files
  File.write('./students.txt', students.to_json)
end

def find_by(key, value)#pass in a key and value
  all().find do |student|#check until whatever doesn't check false it'll output that student.
    student[key].downcase == value.downcase #Key - first name  value whatever that student's first name is.
  end
end

get("/") do
  #The two lines below have the same results
  # students = JSON.parse(File.read('./students.txt'))
	students = all()
  
	erb(:index, { locals: { students: students} })
end


post("/students") do #adding new students to student.txt & students hash/array
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email} #how we construct our hash.


  create(person)
  # students is an array
  # students = JSON.parse(File.read('./students.txt'))
  # add hash to array
  # students.push(person)
  # convert students array to JSON
  # students_json = JSON.generate(students)
  # takes 2 args, file to write and what to write
  # File.write('./students.txt', students_json)

  students = all()

  erb(:index, {locals: { students: students } }) #Index suppose to show every student
end

get("/students") do
	erb(:students)
end

get("/students/:first_name") do
  
  # students = JSON.parse(File.read('./students.txt'))
  # result is the return value of .find
  # result = students.find do |student|
  #   student["first"].downcase == params[:first_name].downcase
  end

  results = find_by("first", params[:first_name])
  # binding.pry

  erb(:student, { locals: { student: result} })
end