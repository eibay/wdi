require 'sinatra'
require 'sinatra/reloader'
require 'pry'

users = Hash.new

get "/" do 
	"Welcome to our page!"
end

# get "/colors" do
# 	response.headers["set-Cookie"] = "color=blue; path=/;"

# 	"Cookies sent!"
# end

# get "/see_cookie" do
# 	request.cookies.to_s
# end

# get "/orange" do
#  if request.cookies["color"] == "orange"
#  	 "It's orange"
#  else 
#   "I don't know that color"
#  end
# end

get "/signup/:name/:password" do

	users[params[:name]] = params[:password]

	"You have signed up"

	users.to_s

end

get "/login/:name/:password" do

	if users[params[:name]] == params[:password]
		# insecure/old-school way
		response.headers["set-Cookie"] = "name=#{params["name"]}; path=/;"
		"You have logged in"
	else
		"Wrong password"
	end

end

get "/logout" do
	response.delete_cookie("name")
	"You have logged out"
end

get "/greeting" do
	if request.cookies["name"] 
	"Hello, #{request.cookies['name']}!"
	else
		"You are not logged in"
	end
end
