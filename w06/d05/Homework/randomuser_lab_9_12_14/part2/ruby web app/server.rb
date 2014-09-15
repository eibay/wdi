require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'pry'

random_users = []

get "/" do
	users = JSON.parse(HTTParty.get("http://127.0.0.1:2000/users"))

	5.times do
		random_users << users[random(users.length)]
		erb(:index, {locals: {random_users: random_users}})
	redirect "/user/:user_id"
end


get "/user/:user_id" do
	user = User.find(params[:user_id])
	comments = Post.where :user_id => user.id
	erb(:show, {locals: {user: user, comments: comments}})
end

post "/comments" do
	comment_hash = {
		specie: params["specie"],
		group: params["group"],
		user_id: params["user_id"]
	}
	comment= Comment.create params[:comment]

end
end