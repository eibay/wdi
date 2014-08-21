
require 'sinatra'
require 'pry'

get("/") do
  erb(:index)
end

get("/name") do
  name = request.params["first_name"]#setting variable for name 
  #making availabe local variables to erb files
  erb(:name, { locals: { name: name } })
  #purple is what the new name is in html and white is the variables we know
  #naming things we want to replace using erb files
  #after locals is gsub
 
end

numbers = [3, 23, 7, 57]

get("/fun") do
  erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
end