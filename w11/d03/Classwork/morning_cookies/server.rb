require 'sinatra'
require 'sinatra/reloader'

users = Hash.new

get '/' do
  "Welcome to our page!"
end

get '/colors' do
  response.headers["Set-Cookie"] = "color=blue; path=/;"

  "Cookies sent!"
end

# below sends the stuff from the browser back to the server.
get '/see_cookie' do
   request.cookies.to_s
end

# Exercise - Logic to write cookie and change the behavior of the cookie by writing another route that if the color is orange, have it say color is orange otherwise have it say idk this color.

# get '/change_cookie' do
#   if request.headers["color"] == "orange"
#      "Color is orange"
#   else
#      "Idk this color"
#   end
# end

get '/change_cookie' do
  if request.cookies["color"] == "orange"
    "It's orange"
  else
    "Its not orange"
   end
end

get '/sign_up/:user_name/:password' do
  user_name = params["user_name"]
  password = params["password"]
  user_name = "Tim"
  password = "Blah"
  users.add(user_name, password)
end





