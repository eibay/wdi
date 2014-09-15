require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require 'active_record'
require_relative './lib/connection'
require_relative './lib/users'
require_relative './lib/comments'

get '/' do 
	users = User.all()
	if params[:page] && params[:page].to_i > 1
		page = params[:page].to_i
	else
		page = 1
	end
	offset = (page - 1) * 5
	erb(:index, { locals: {users: users, page: page, offset: offset } })
end

get '/user/add' do
	random = JSON.parse(HTTParty.get("http://127.0.0.1:2000/users/create"))
	user = {name: random["name"], instrument: random["instrument"]}
	User.create(user)
	users = User.all()
	user_id = users.last[:id]
	redirect("/user/user_id?id=#{user_id}")
end

get '/user/user_id' do 
	user = User.find_by(id: params[:id])
	comments = Comment.where(user_id: params[:id])
	erb(:user, { locals: {user: user, comments: comments} })
end

post '/users/user/comment' do 
	user_id = params[:user_id]
	if params[:commentor] == ""
		commentor = "Anonymous"
	else
		commentor = params[:commentor]
	end
	comment = {commentor: commentor, comment: params[:comment], user_id: user_id}
	Comment.create(comment)
	redirect("/user/user_id?id=#{user_id}")
end