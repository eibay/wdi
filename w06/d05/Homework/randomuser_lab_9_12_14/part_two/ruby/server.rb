require 'sinatra'
require 'pry'
require 'httparty'
require 'active_record'
require_relative './lib/characters.rb'
require_relative './lib/connection.rb'

after do
	ActiveRecord::Base.connection.close
end

# heathers_characters = [
#   {name:"Veronica Sawyer", age:"17", id:1, quote:"What is your damage, Heather?", url:"http://oliviawedderburn.files.wordpress.com/2013/03/veronica-sawyer-heathers-winona-ryder.jpg", comment: ""},
#   {name:"Martha Dumptruck", age:"16", id:2, quote:"I'd like that.", url:"http://www.gannett-cdn.com/-mm-/bfcf9458cd8dbdfcb41c4e4c0cc687a69750461e/c=37-0-475-329&r=x404&a...", comment: ""},
#   {name:"Betty Finn", age: "15", id:3, quote:"Nice guys finish last, I should know", url:"http://photos1.blogger.com/blogger/1416/3034/1600/heathers48.0.jpg", comment: ""},
#   {name:"JD Dean", age: "20", id:4, quote:"Chaos is what killed the dinosaurs, darling.", url: "http://img1.wikia.nocookie.net/__cb20120610233931/villains/images/b/bf/Jason_'J.D.'_Dean.jpg", comment: ""},
#   {name:"Heather Chandler", age:"21", id:5, quote:"Did you have a brain tumor for breakfast?", url:"http://photos1.blogger.com/blogger/609/1846/1600/heather%201%20Heather%20Chandler.3.jpg", comment: ""}
#   ]

#   heathers_characters.each do |character|

#   	Character.create(character)
#   end

get("/") do
	users = HTTParty.get('https://127.0.0.1:2000/users')

	5.times do
		list << Character.all().sample
	end

	erb(:index, { locals: { list: list }})
end

post("/user") do
	new_character = {"name" => params[:name], "age" => params[:age], "id" => Character.all().length+1, "quote" => params[:quote], "url" => params[:url]}
	Character.create(new_character)
	erb(:character, { locals: { character: new_character}})
end

get("/user/:id") do
	character = Character.find_by(id: params[:id])
	erb(:character, { locals: { character: character }})
end

post("/comment/:id") do
	character = Character.find_by(id: params[:id])
	# character_hash = {"comment" => params[:comment]}
	binding.pry
	# character.update(character_hash)
	character.comment = params[:comment]
	character.save
	redirect "/user/:id"
end



