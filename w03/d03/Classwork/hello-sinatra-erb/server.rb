require 'sinatra'

get("/") do
  erb(:index) #passing the name of the file and gsubing 
end

get("/name") do
  name = request.params["first_name"] #from the form, via a query string, turns it into a hash
  erb(:name, { locals: { name: name } }) #connected with <%= name %>
end

numbers = [3, 23, 7, 57]

get("/fun") do
  erb(:fun, { locals: { time: Time.now, favorite_numbers: numbers } })
end