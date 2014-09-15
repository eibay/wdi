require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require_relative './lib/connection'
require_relative './lib/user'
require_relative './lib/comment'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  random_users = HTTParty.get("http://127.0.1:2000/users?page_length=5&page_num=1")
  random_users = JSON.parse(random_users)
  erb(:index, {locals: { users: User.all() }})
end

post("/user/create") do

  random_users = HTTParty.post("http://127.0.1:2000/user/create")

  random_users = JSON.parse(random_users)

  user_hash = {name: params["name"], information: params["information"]}

  User.create(user_hash)

  erb(:"users/new", {locals: {users: User.all() }})
end

get("/user/user_id") do
  user = User.find_by({id: params[:id]})
  comments = Comment.where({user_id: params[:id]})
  erb(:"users/show", {locals: {user: user, comments: comments}})
end

post("/comment/user_id") do
end
