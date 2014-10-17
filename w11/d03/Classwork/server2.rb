require 'sinatra'
require 'sinatra/reloader'
require 'faker'
require 'pry'

users = Hash.new

get '/' do 
	"welcome to our page!"
end

get '/colors' do
	response.headers["Set-Cookie"] = "color=orange; path=/;"

	"cookies sent"
end

get '/see_cookie' do
	request.cookies.to_s
end

get '/orange' do
	if request.cookies["color"] == "orange"
		"It's orange"
	else
		"This color sucks"
	end
end

get '/sign_up/:user/:password' do
	users[params[:user]] = params[:password]

	"You have signed up!"
end


get '/login/:user/:password' do
	if users [parmas[:user]] == params[:password]
		response.headers["Set-Cookie"] = ":user=#{params["user"]}; path=/;"
		"you have logged in"
	else
		"try again"
	end
end

get '/logout' do
	response.delete_cookie("user")
	"You have logged out!"
end

get '/greeting' do
	if request.cookies["user"]
		"Hello"
	else
		"Please log in"
	end
end




