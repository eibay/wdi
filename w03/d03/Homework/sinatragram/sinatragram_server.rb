# parts to the program:

# update the server
	# add correct "paths"
	# get the correct data collected
# updated the .erb sheets



require 'sinatra'

get("/") do
  erb(:index)
end

# request.params = the key
get("/name") do
  name = request.params["first_name"]
 # the line below SENDS THE VALUE NAME INTO THE NAME ERB FILE
  erb(:name, { locals: { name: name } })
end

numbers = [3, 23, 7, 57]

get("/fun") do
  erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
end
