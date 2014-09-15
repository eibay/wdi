require 'sinatra'
require 'sinatra/reloader'
require_relative './connection'
require_relative './comment'
require 'httparty'
require 'pry'
require 'json'

get("/") do 
	page=1
	unless(params[:page] == nil)
		page=params[:page].to_i
	end
	next_page=page+1
	previous_page=page-1

	api=HTTParty.get("http://127.0.0.1:3000/users?page=#{page}&page_length=5")
	characters=JSON.parse(api)
	
	erb(:index, {locals:{characters:characters, next_page:next_page, previous_page:previous_page}})
end

get("/user/:id") do
	id=params[:id].to_i

	api=HTTParty.get("http://127.0.0.1:3000/user/#{id}")
	character=JSON.parse(api)
	comments=Comment.where(character_id: id)
	erb(:individual_character, {locals:{character: character, comments:comments}})
end

post("/adduser") do
	api=HTTParty.post("http://127.0.0.1:3000/user/create")
	new_char=JSON.parse(api)

	redirect"/user/#{new_char['id']}"
end

post("/addcomment/:id") do
	id=params[:id].to_i
	comment=Comment.new
	comment.author=params[:name]
	comment.content=params[:content]
	comment.character_id=id
	comment.save

	redirect "/user/#{id}"
end