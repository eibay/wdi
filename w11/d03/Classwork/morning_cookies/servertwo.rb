require 'sinatra'
require 'sinatra/reloader'

users = Hash.new

get '/' do
  "Welcome to our page!"
end

get '/sign_up/:user_name/:password' do
  users[ params["user_name"] ] = params["password"]

  "You have signed up!"

  users.to_s
end

get '/login/:user_name/:password' do
  if  users[ params["user_name"] ] == params["password"]
      response.headers["Set-Cookie"] = "user_name=#{params["user_name"]}; path=/;"
    "You have logged in!"
  else
    "Try again!"
  end
end

get '/logout' do
  response.delete_cookie("user_name")

  "You have logged out!"
end

get '/greeting' do
  if request.cookies["user_name"]
    "Hello there #{request.cookies["user_name"]}"
  else
    "Please log in to continue"
  end
end



