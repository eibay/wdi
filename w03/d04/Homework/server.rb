require 'sinatra'
require 'pry'

regstudents =[]


post("/")do 
  newstudent = {}
  newstudent["firstname"]= params["firstname"].capitalize
  newstudent["lastname"] = params["lastname"].capitalize
  newstudent["age"] = params["age"]
  newstudent["smell"] = params["smell"]
  regstudents << newstudent
  erb(:index, {locals: {regstudents: regstudents}})
end

get("/") do
   erb(:index, {locals: {regstudents: regstudents}})
end

get("/students/new") do
  erb(:newstudents)
end

get("/students/show/:name") do

  name = params[:name]
  erb(:studentinformation, {locals: {regstudents: regstudents, name: name}})
end

get("/search") do 
  erb(:search)
end

get("/results") do
  searchname = params["search"].capitalize
  i = 0
  while i < regstudents.length 
  if regstudents[i]["firstname"].include? searchname
    named = regstudents[i]["firstname"]
    end
  i += 1
end
erb(:results, {locals: {named: named}})

end


