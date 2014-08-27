require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

def all()
  return JSON.parse(File.read('./students.txt'))
end

def create(student) 
# the parameter student is typically a hash, but it could be a string, hash is ideal tho for how we'll use it/
# we can pass the variable student through here (and still call the param 'student')

  students = all()
  students.push(student)
  File.write('./students.txt', students.to_json) 
  # students.to_json is THE SAME as JSON.generate(students)
end

def find_by(key, value)
  all().find do |student|
    student[key] == value
  end
end

get("/") do

  # replace this with the method all
  # students = JSON.parse(File.read('./students.txt'))
  # students = all()

  all()
  
	erb(:index, { locals: { students: students} })

  # we could do it with all() in the place of students since it equals students, but not recommended
  erb(:index, { locals: { students: all()} })

end


post("/students") do

# we need to keep these variable names because we refer to them later

  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  students = JSON.parse(File.read('./students.txt'))
  
  students.push(person)

  students_json = JSON.generate(students)
  # takes 2 args, file to write and what to write

  File.write('./students.txt', students_json)

  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end

get("/students/:first_name") do 
  all()
  # the method all replaces the code below - i think? 
  # students = JSON.parse(File.read('./students.txt'))

  find_by(params[:first_name].downcase, student["first"].downcase)
        # the method find_by replaces the code below - i think?

        # result is the return value of .find
        # result = students.find do |student|
        #   student["first"].downcase == params[:first_name].downcase
        # end

things that 
 
  erb(:student, { locals: { student: result} })
end













