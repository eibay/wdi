require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require 'JSON'
require 'HTTParty'
require_relative './lib/connection'
require_relative './lib/redshirt'
require_relative './lib/comment'
newchar=[]
get("/") do 
	5.times {
		api = JSON.parse(HTTParty.post("http://127.0.0.1:2000/user/create"))
		newchar.push(api) 
	}
	@title = "prospective redshirts"
	erb(:index, locals: {newchar: newchar, redshirts: Redshirt.all()})
end

get("/user/:id") do 
	if Redshirt.find_by(id: params[:id]) == nil
 		newchar.each do |char|
 			if char[0]["xid"].to_s == params[:id]
 				newChar = {
				fname: char[0]["fname"],
				lname: char[0]["lname"],
				nname: char[0]["nname"],
				town: char[0]["town"],
				looks: char[0]["looks"],
				attitude: char[0]["attitude"],
				last_words: char[0]["last_words"],
				xid: char[0]["xid"]
				}
				Redshirt.create(newChar)
			end
		end
	end
	thisChar = Redshirt.find_by(id: params[:id])
	

	if Comment.find_by(redshirt_id: params[:id]) == nil
		comment = "no comment"
		else
			comment = Comment.select(redshirt_id: params[:id])
	end
binding.pry
 @title = "#{thisChar["fname"]} #{thisChar["lname"]}"
	erb(:user, locals: {thisChar: thisChar, comment: comment})
end

get("/new") do 
	char = JSON.parse(HTTParty.post("http://127.0.0.1:2000/user/create"))
	binding.pry
 			thisChar = {
				fname: char[0]["fname"],
				lname: char[0]["lname"],
				nname: char[0]["nname"],
				town: char[0]["town"],
				looks: char[0]["looks"],
				attitude: char[0]["attitude"],
				last_words: char[0]["last_words"],
				xid: char[0]["xid"]
			}
		thisChar = Redshirt.create(thisChar)
	
	 @title = "#{thisChar["fname"]} #{thisChar["lname"]}"
	 comment = Comment.find_by(redshirt_id: thisChar[:id])
	erb(:user, locals: {thisChar: thisChar, comment: comment})
end

post("/comment") do 
	newComment = {
		commenter: params["name"],
		comment: params["comment"],
		redshirt_id: params["redshirt_id"]
	}
	newComment = Comment.create(newComment)
	redirect "/"
end
