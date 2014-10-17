require 'sinatra'
require 'sinatra/reloader'
require 'pry'


users = Hash.new


get '/signup/:user/:password' do
  users[params[:user]] = params[:password]
  users.to_s
end

get '/login/:user/:password' do
  user = params[:user]
  password = params[:password]
  if users[user] == password
    response.headers["Set-Cookie"] = "name=#{user}; path = /;"
    "Correct"
  else 
    "Incorrect"
  end
end

get '/logout' do
  response.delete_cookie("name")
  "you have logged out"
end


get '/greeting' do
if request.cookies["name"]
  "Hello #{request.cookies["name"]}"
else
  "Please login"
end
end




get '/' do
  "Welcome"
end


# get '/colors' do
#   response.headers["Set-Cookie"] = "color=orange; path = /;"
#   "Cookie set"
#   #how to put info into headers
#   #use cookie for anything that has /
# end

# get '/see_cookie' do
# request.cookies.to_s
#   #will shows the cookies in browswer

#   end


#   get '/orange' do 
#     if request.cookies["color"] == "orange"
#       "ORANGE"
#     else
#       "not orange"
#     end


#   end