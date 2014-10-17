require 'sinatra'
require 'sinatra/reloader'
require 'pry'

users = Hash.new

get '/' do
  "Welcome to Your Doom!"
end

get '/colors' do
  colors = ['orange', 'purple', 'green', 'blue', 'black']
  random_color = rand(colors.length)
  set_colors = (random_color)
  response.headers["Set-Cookie"] = "color=#{colors[set_colors]}; path=/;"
  "Cookies sent!"
end

get '/see_cookie' do
  # request.cookies.to_s
  if request.cookies["color"] == "orange"
    "I love the color orange!" else
    "I don't like that color."
  end
end

get '/signup/:user/:pass' do
  username = params[:user]
  password = params[:pass]
  users[username] = password
  response.headers["Set-Cookie"] = "user=#{username}; path=/;"
  puts users
  "Thanks!"
end

get '/login/:user/:pass' do
  username = params[:user]
  password = params[:pass]

  # users.keys.each do |u|
  #   if u == username && users[username] == password
  #     response.headers["Set-Cookie"] = "user=#{username}; path=/;"
  #     puts users
  #     "Hello there old chap!"
  #   else
  #     "Access denied."
  #   end
  # end
puts users

  if users[ username ] == password
    response.headers["Set-Cookie"] = "user=#{username}; path=/;"
    "You have logged in!"
  else
    "Access Denied."
  end

end

get '/logout' do
    response.delete_cookie("user")
    "Logged out"
end

get '/greeting' do
  if request.cookies["user"]
    "Hello #{request.cookies['user']}!"
  else
    "Please sign in!"
  end
end
