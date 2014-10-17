require 'sinatra'
require 'sinatra/reloader'

users = Hash.new

# class User
# 	def initialize(user, password)
# 		@user, @password = user,password
# 	end
# end

get '/' do
	 "Welcome to our page!"
end

get 'sign_up/:user/:password' do
	users[ params[:user] ] = params[:password]
	"You hae signed up!"
end

get 'login/:user/:password' do
	if users[ params[:user] ] == params[:password]
		response.headers["Set-Cookie"] = "user=#{params["user"]}; path=/;"
		"You have logged in!"
	else
		"Try again!"
	end
end

get 'logout' do
	response.delete_cookie("user")
	"You have logged out!"
end

get '/greeting' do

end

