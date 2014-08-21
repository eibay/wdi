require 'sinatra'
require 'pry'

get("/") do
  erb(:index)
end

get("/name") do
  name = request.params["first_name"]
  erb(:name, { locals: { name: name } })
binding.pry
end

numbers = [3, 23, 7, 57]

get("/fun") do
  erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
end