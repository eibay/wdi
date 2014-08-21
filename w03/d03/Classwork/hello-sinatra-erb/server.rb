require 'sinatra'

get("/") do
  erb(:index)
end

get("/name") do
  octopus = request.params["first_name"]
  erb(:name, { locals: { anything: octopus } })
end

numbers = [3, 23, 7, 57]

get("/fun") do
  erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
end