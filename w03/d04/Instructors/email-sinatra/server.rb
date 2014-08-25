require 'sinatra'

get("/") do
  erb(:index)
end

info = []

post("/info") do
  # Grab the data from the form
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = { first: first_name, last: last_name, email: email }

  # add the hash to the array
  info.push(person)

  erb(:info, { locals: { information: info } })
end

get("/info") do
  erb(:info, { locals: { information: info } })
end