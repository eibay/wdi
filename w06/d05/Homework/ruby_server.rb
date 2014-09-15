require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './libs/methods'
require_relative './connection'
require 'pry'

get("/")do 

	erb(:index, {locals: { response: Name.all() }})
end 


post("/new_user") do 

	response_JSON = HTTParty.post("http://127.0.0.1:2000/user/create")
	response = JSON.parse(response_JSON)
	
	Name.create(response.last) 
	
	redirect "/"
end 

get("/user/:id") do 
	blues_name = Name.find_by(id: params["id"])
	id = blues_name.id.to_s
	comm = Comment.select(names_id: id)

	erb(:individual_page, {locals: { user: blues_name, comments: comm }})
end 

post("/comment") do 
	id = Name.find_by(id: params["id"])

	hash = {
		names_id: id, 
		text:  params["comment"]
	}
	Comment.create(hash)
	redirect "/"

end 

get("/search") do 
	user = Name.find_by(first: params["first_name"], second: params["second_name"], third: params["third_name"])
	user_id = user.id
	response = HTTParty.get("http://127.0.0.1:2000/user/#{user_id}")
	redirect("/user/#{user_id}")
end 

