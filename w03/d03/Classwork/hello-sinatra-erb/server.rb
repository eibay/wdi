# require 'sinatra'

# get("/") do
#   erb(:index)
# end

# get("/name") do
#   name = request.params["first_name"]
#   erb(:name, { locals: { name: name } })
# end

# numbers = [3, 23, 7, 57]

# get("/fun") do
#   erb(:fun, { locals: { favorite_numbers: numbers, time: Time.now } })
# end

# NOTE ON ERB STRUCTURE:  
# (Object) erb(template, options = {}, locals = {}, &block)

# trying stuff out

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


# what the output looks like on the screen for the 'fun' page

# Today's date is 08/20/2014

# My favorite numbers are:

# these are bullets:
# 3
# 23
# 7
# 57
# Oh, and 1 + 1 = 2

# this is a link
# Home










