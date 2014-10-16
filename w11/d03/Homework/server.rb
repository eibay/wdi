require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/connection.rb'
require_relative './lib/user.rb'

after do
  ActiveRecord::Base.connection.close
end

use Rack::Session::Cookie, {
  :key => 'rack.session',
  :path => '/',
  :secret => 'accountinformation'
}



get "/" do
  erb(:index)
    #login page
  end

  post "/user" do
    login = params[:login]
    password = params[:password]
    user = User.find_by({name: login})
    if user 
      user.authenticate(password) #give you the user if true or false
       if user 
          session[:user] = user.name
           erb(:user, {locals: {user: user}})
      else
        erb(:index)
      end
    else
    erb(:index)
  end
end



    # user = User.where({name: login, password: password})
    # if user[0]
    #   session[:user] = user[0].name
    #   erb(:user, {locals: {user: user[0]}})
    # else
    #   erb(:index)
    # end
  # end

  get "/users/new" do
    erb(:signup)
  end

  post "/users" do
    user = {name: params[:login], password: params[:password], amount: params[:amount]}
    User.create(user)
    erb(:index)
  end


  get "/users/:id" do
    user = User.find(params[:id])
    if session[:user] == user.name
    #seeing that users info with a place to change value
    erb(:user, {locals: {user: user}})
  else
    erb(:index)
  end
end

put "/users/:id" do
  user = User.find(params[:id])
  if session[:user] == user.name
    newUser = {amount: params[:amount]}
    user.update(newUser)
    erb(:user, {locals: {user: user}})
  else
    erb(:index)
  end
end


get "/logout" do
  response.delete_cookie 'rack.session'
  erb(:index)
end
