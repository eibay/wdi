require 'sinatra'
require 'sinatra/reloader'

users = Hash.new

get '/' do
	"Welcome to our page!"
end

get '/sign_up/:user/:password' do
	users[ params[:user] ] = params[:password]

	"You have signed up!"

	# puts users
end

get '/login/:user/:password' do
	if users[ params[:user] ] == params[:password]
		response.headers["Set-Cookie"] = "user=#{params["user"]}; path=/;"
		"You have logged in!"
	else
		"Try again!"
	end
end

get '/logout' do
	response.delete_cookie("user")

	"You have logged out!"
end

get '/greeting' do
	if request.cookies["user"]
		"Hello #{request.cookies["user"]}!"
	else
		"Please log in!"
	end
end


