require 'sinatra'
require 'pry'

get("/") do
  erb(:index)
end

post("/name") do
  name = request.params["first_name"]
  erb(:name, { locals: { name: name } })
end

numbers = [7, 1.618, 0, 2]

get("/fun") do
  erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
end
