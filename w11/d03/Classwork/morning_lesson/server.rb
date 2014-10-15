require 'sinatra'
require 'sinatra/cookies'
require 'haml'

get "/sign_in" do 
  if params["user"] 
    response.headers["Set-Cookie"] = "user=" + params["user"] + "; path=/;"
    redirect '/'
  else 
    haml :sign_in 
  end 
end 

get '/' do 
  if cookies[:user]
    "Hello, " + cookies[:user] + '!'
  else 
    redirect "/sign_in"
  end 
end 