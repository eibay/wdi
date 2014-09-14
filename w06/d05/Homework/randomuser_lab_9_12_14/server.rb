require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'HTTParty'
require 'json'
require_relative './lib/connection.rb'
require_relative './lib/user.rb'
require_relative './lib/comment.rb'

after do
  ActiveRecord::Base.connection.close
end

get "/" do 
  users = HTTParty.get("http://127.0.0.1:2000/users?page_length=5&page_num=1")
  users = JSON.parse(users)
  users.each do |user|
    if User.where({name: user["name"], job: user["job"]}).length == 0
    user = {name: user["name"], job: user["job"]}
    User.create(user)
    end
  end
  erb(:index, {locals: {users:User.all}})
end

post "/random" do
  userrandom = HTTParty.post("http://127.0.0.1:2000/user/create")
  userrandom = JSON.parse(userrandom)
  if User.where({name: userrandom["name"], job: userrandom["job"]}).length == 0
    user = {name: userrandom["name"], job: userrandom["job"]}
    User.create(user)
  end
  user = User.find_by({name: userrandom["name"], job: userrandom["job"]})
  comments = Comment.where({random_id: user.id})
  erb(:user, {locals: {user: user, comments: comments}})
end

get "/user/:id" do
  user = User.find_by({id: params[:id]})
  comments = Comment.where({random_id: params[:id]})
  erb(:user, {locals: {user: user, comments: comments}})
end

post "/comment/:id" do
  user = User.find_by({id: params[:id]})
  comment = {comment: params[:comment], random_id: params[:id]}
  Comment.create(comment)
  comments = Comment.where({random_id: params[:id]})
  erb(:user, {locals: {user: user, comments: comments}})
end

