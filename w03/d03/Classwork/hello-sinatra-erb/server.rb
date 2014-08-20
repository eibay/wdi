require 'sinatra'
require 'pry'

get("/") do
  erb(:index)
end

get("/name") do
	binding.pry
  name = request.params["first_name"]
  erb(:name, { locals: { name: name } })
  #name key in hash linked to <h1>Hello <%= name %></h1> in name.erb
end

numbers = [3, 23, 7, 57]

get("/fun") do
  erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
end