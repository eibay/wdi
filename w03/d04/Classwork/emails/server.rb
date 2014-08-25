require 'sinatra'
require 'pry'

get("/") do
	erb(:index)
end

email_list = []
post("/email") do 

	binding.pry
	email_list.push request.params["first"]
	email_list.push request.params["last"]
	email_list.push request.params["email"]

	erb(:email, {locals: {email: email_list} })
end
get("/email") do 
	erb(:email, {locals: {email: email_list} })
end