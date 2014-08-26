require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# define methods # 

def all 
  f = File.read "./students.txt" 
  JSON.parse f 
end 

def create student 
  students_arr = all 
  students_arr << student 
  students_json = students.to_json 
  File.write "./students.txt", students_json  
end 

# returns any student for whom any of their info 
# matches the query else returns nil #  
def find_any_match_for q
  all.each do |student|
    student.keys.each do |key| 
      if student[key] == q  
        return student
      end
    end 
  end  
  nil 
end 


# main app #

get("/") do
	students = all 

	erb(:index, { locals: { students: students} })
end


post("/students") do

  # create a student &
  # write them to db #  
  first_name, last_name, email = params["first"], params["last"], params["email"]
  person = {"first" => first_name, 
    "last" => last_name, 
    "email" => email}
  create person 

  # read db # 
  students = all 

  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end


get "/student/:student" do

  result = find_any_match_for params[:student] 


  erb :student, {locals: {student: result }}
end 
