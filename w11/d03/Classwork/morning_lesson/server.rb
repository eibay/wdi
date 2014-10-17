require 'sinatra'
require 'sinatra/cookies'
require 'haml'

use Rack::Session::Cookie, :key => "rack.session",
                           :path => '/', 
                           :secret => "tsosttpgtwittfc"

get "/sign_in" do 
  if params["user"] 
    session[:user] = params["user"]
    redirect '/'
  else 
    haml :sign_in 
  end 
end 

get '/' do 
  if session[:user]
    haml :index, { locals: {user: session[:user]}}
  else 
    redirect "/sign_in"
  end 
end 

get "/sign_out" do 
  session.clear 
  redirect "/sign_in"
end 