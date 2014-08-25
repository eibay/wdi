require 'sinatra'
require 'pry'

student_information = []

get("/students/new")do
  erb(:new_student_page)
end


post("/")do
  first_name = params["first_name"]
  last_name = params["last_name"]
  fav_spell = params["fav_spell"]
  student_information.push(first_name, last_name, fav_spell)
  erb(:index, {locals: { ids: [first_name, last_name, fav_spell], info: student_information }})
end

get("/")do
  first_name = params["first_name"]
  last_name = params["last_name"]
  fav_spell = params["fav_spell"]
  erb(:index, {locals: { ids: [first_name, last_name, fav_spell], info: student_information }})
end

get("/students/show/:name")do

  x = 0
  while x < student_information.length

  first_name = params["first_name"]
  if params[:name] == student_information[x]
    specific_name = "#{student_information[x]}, #{student_information[x + 1]}, #{student_information[x + 2]}"
    return specific_name
  else
    x += 3
  end
end
  # last_name = params["last_name"]
  # fav_spell = params["fav_spell"]
  erb(:specific_student, {locals: {students: specific_name }})
end

get("/search")do
  first_name = params["first_name"]
  last_name = params["last_name"]
  erb(:student_search, {locals: { ids: [first_name, last_name], info: student_information }})
end

get("/currently/enrolled")do
  first_name = params["first_name"]
  last_name = params["last_name"]
  erb(:current_student, {locals: {ids: [first_name, last_name], info: student_information }})
end







