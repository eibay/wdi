require 'sinatra'

get("/") do
<<<<<<< HEAD
  erb(:index) #passing the name of the file and gsubing 
end

get("/name") do
  name = request.params["first_name"] #from the form, via a query string, turns it into a hash
  erb(:name, { locals: { name: name } }) #connected with <%= name %>
=======
  erb(:index)
end

get("/name") do
  name = request.params["first_name"]
  erb(:name, { locals: { name: name } })
>>>>>>> 88e81ff9b8647f42a49d8fc797d43bfe911f3de5
end

numbers = [3, 23, 7, 57]

get("/fun") do
<<<<<<< HEAD
  erb(:fun, { locals: { time: Time.now, favorite_numbers: numbers } })
=======
  erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
>>>>>>> 88e81ff9b8647f42a49d8fc797d43bfe911f3de5
end