require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative './db/connection.rb'
require_relative './lib/models.rb'
require 'pry'
require 'faker'

get '/' do

  erb(:index)
end

get '/signup' do

  erb(:signup)
end

post '/signup' do
  name = params["name"]
  email = params["email"]
  password = params["password"]

  User.create({name: name, email: email, password: password})
  erb(:index)

end

get '/login' do

  erb(:login)
end

post '/user' do
  name = params["name"]
  email = params["email"]
  user = User.find_by(email: email)
  redirect to '/user/:id', params[:id]
end

get '/user/:id/' do
  binding.pry
  user = User.find_by(:id)

  erb(:user, locals: {user: user})
end
