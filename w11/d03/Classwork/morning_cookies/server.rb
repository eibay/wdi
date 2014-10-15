require 'sinatra'
require 'sinatra/reloader'
require 'pry'

users = Hash.new
# create a signup route, that takes two params in its url, username and password, and i want to create a new user with a hash 



# class User
# 	def initialize(user, password)
# 		@name = name
# 		@password = password
# 	end
# end



get '/' do
	 "Welcome to our page!"
end

# get '/colors' do
# 	response.headers["Set-Cookie"] = "color=orange; path=/;"

# 	"Coooookies sent!"
# end

# get '/see_cookie' do
# 	request.cookies.to_s
# end

# get '/dis_color' do
# 	if request.cookies["color"] == "purple"
# 		"The color is purple!"
# 	else
# 		"I hate this color!"
# 	end
# end

get '/sign_up/:user/:password' do
	users [ params[:user]] = params[:password]
	"You have signed up"
end
	
	# users[ params [:user] ] = params[:password]
	# people.each do |user, password|
	# 	if user = users[:user] && password = users[:password]
	# 		response.headers["Set-Cookie"] = "user=#{{params["user"]}}"
	# 	else 
	# 		"no coookies pour vous"
	# "You have signed up!"
	# puts users


get '/login/:user/:password' do

	if users[ params[:user] ] == params[:password]
		response.headers["Set-Cookie"] = "user=#{params["user"]}; path=/;"
		"you have logged in"
	else
		"No Cooooookies for uuu"
	end
end

get '/logout' do
	response.delete_cookie("user")
	"you have logged out!"	
end

get '/greeting' do
	if request.cookies["user"]
		"Helllowww #{request.cookies["user"]}"
	else
		"you still haven't loooged in"
	end
end

# binding.pry

# write a route that says if the color is purple, puts the color is purple else puts i hate this color