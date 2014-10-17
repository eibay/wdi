require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative './models.rb'
require_relative './connection.rb'
require 'bcrypt'
require 'pry'

get '/' do

  erb(:index)
end

post '/signup' do
  username = params["name"]
  password = params["password"]

  user = User.new(name: username)
  user.password = password

  user.save

  redirect to '/'
end

post '/login' do
  username = params["name"]
  password = params["password"]

  user = User.find_by(name: username)
  if user == nil || user.authenticate(password) == false
    "Access Denied"
  else
    redirect to "/hello?username=#{username}"
  end
end

get '/hello' do
  "Hello #{params[:username]}"
end
