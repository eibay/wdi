require 'sinatra'
require 'sinatra/reloader'
require 'pry'

use Rack::Session::Cookie, {
  :key => 'rack.session',
  :path => '/',
  :secret => '283y23wdhjjdghjfehjghjf'
}

# above code sets up sessions and configures this tamper proof cookie

users = Hash.new

get '/' do
  "Welcome to our page, #{session[:user_name]} "
end

get '/sign_up/:user_name/:password' do
  users[params[:user_name]] = params[:password]
  # session[:user_name] = "tim"
  # session[:password] = "123"
  'You just signed up!'
  users.to_s
end

get '/login/:user_name/:password' do
  if  users[ params[:user_name] ] == params[:password]
      session[:user_name] = params[:user_name]

      # response.headers["Set-Cookie"] = "user_name=#{params["user_name"]}; path=/;"
    "You have logged in!"
  else
    "Try again!"
  end
end

get '/logout' do
  response.delete_cookie("rack.session")
    # session.clear
    # session.clear is the hackey way of doing the same thing but leaves a trace of the cookie, its like the innerhtml way of setting something to an empty string.
    "You have logged out"
end


get '/greeting' do
  if session[:user_name] == params[:user_name]
    "Hello there #{session[:user_name]}"
  else
    "Please log in to continue"
  end
end

# That's what session does in the head of our response it tells the browser to set a cookie on itself. But instead of the set cookie way we did in the morning this makes it tamper proof.



