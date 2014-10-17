require 'sinatra'
require_relative 'lib/connection'
require_relative 'lib/user'
require_relative 'lib/account'

use Rack::Session::Cookie, :key => "rack.session", 
                           :path => '/', 
                           :secret => "thereismoneyinthebank"

get "/sign_in" do 
  if params["email"] 
    user = User.where :email, params["email"] 
      if user.password == params["password"] 
        session[:user_id] = user.id 
      end 
  else 
    haml :sign_in 
  end 
end 

get '/' do 
  if session[:user_id]
    user = User.find_by_id(session[:user_id]) 
    account = Account.find_by_id(session[:user_id]) 
    haml :index, {locals: {user: user, account: account}}
  else 
    redirect "/sign_in"
  end 
end 

get "/sign_out" do 
  session.clear 
  redirect "/sign_in"
end