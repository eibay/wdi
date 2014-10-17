require 'sinatra'
require 'sinatra/reloader'
require 'pry'

use Rack::Session::Cookie, {
  :key => 'rack.session',
  :path => '/',
  :secret => 'slytherin'
  }


users = Hash.new

get '/' do
  "Welcome to Your Doom!<br /> Hello, #{session[:user]}"
end

get '/colors' do
  colors = ['orange', 'purple', 'green', 'blue', 'black']
  random_color = rand(colors.length)
  set_color = colors[random_color]
  session[:color] = set_color
  # response.headers["Set-Cookie"] = "color=#{colors[set_colors]}; path=/;"
  "All set!"
end

get '/see_cookie' do
  # request.cookies.to_s
  puts session[:color]
  if "green" == session[:color]
    "I love the color green!"
  else
    "I don't like that color."
  end
end

get '/signup/:user/:pass' do
  username = params[:user]
  password = params[:pass]
  users[username] = password
  session[:user] = username
  puts users
  "Thanks!"
end

get '/login/:user/:pass' do
  username = params[:user]
  password = params[:pass]

puts users

  if users[ username ] == password
    "You have logged in!"
  else
    "Access Denied."
  end

end

get '/logout' do
    response.delete_cookie("rack.session")
    "Logged out"
end

get '/greeting' do
  if session
    "Hello #{session[:user]}!"
  else
    "Please sign in!"
  end
end
