require "sinatra"
require "sinatra/reloader"

users = Hash.new


get("/") do 
	"Hello World"
end

get("/colors") do
	response.headers["Set-Cookie"] = "color=orange; path=/;"

	"cookies sent"
end

get("/see_cookie") do 
	request.cookies.to_s
end

get("/blue") do 
	response.headers["Set-Cookie"] = "color=blue; path=/;"

	"cookies sent"
end

get("/signup/:user/:password") do
	user = params[:user]
	password = params[:password]
	users[user] = password
	users.to_s
end

get("/login/:user/:password") do
	
	if users[params[:user]] == params[:password]
		response.headers["Set-Cookie"] = "user=#{params[:user]}; path=/;"
		"login successful"
	else 
		"wrong user name or password"
	end

end

get("/logout") do
	response.delete_cookie("user")
	"logout successful"
end

get("/greeting") do
	if request.cookies["user"]
	name = request.cookies["user"]
	"hello #{name}"
	else 
		"please log in"
	end

end

