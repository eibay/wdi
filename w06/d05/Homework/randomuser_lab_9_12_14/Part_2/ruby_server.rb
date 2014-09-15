require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'pry'


comments = []

get "/" do 
	characters_api = HTTParty.get("http://localhost:2000/users?page_length=5&page_num=1")
	new_user_api = HTTParty.post("http://localhost:2000/user/create")

	characters = JSON.parse(characters_api)
	new_user = JSON.parse(new_user_api)

	erb(:main, {locals: { characters: characters, new_user: new_user}})
end

get "/user/:id" do 
	characters_api = HTTParty.get("http://localhost:2000/users")
	characters = JSON.parse(characters_api)

	user = characters.find { |user| user["id"] == params["id"].to_i}
	comments = comments.select { |x| x["user_id"] == params["id"]}

	erb(:user_page, {locals: { user: user, comments: comments}})
end

post "/comments" do 
	new_comment = {content: params["comment"], user_id: params["user_id"]}

	comments << new_comment

	characters_api = HTTParty.get("http://localhost:2000/users")
	characters = JSON.parse(characters_api)

	user = characters.find { |user| user["id"] == params["user_id"].to_i}
	comments = comments.select { |x| x[:user_id].to_i == params["user_id"].to_i}

	erb(:user_page, {locals: { user: user, comments: comments}})
end








