# creating a sign up route
# it should be a get route that has two params in url, one for user and one for password
# insert params into hash we made with user as the key and password as the value

require 'sinatra'
require 'sinatra/reloader'

users = Hash.new

accounts = {
	"jeff" => "098238201", 
	"ray" => "0823048209"
}

get '/' do 
	"welcome to our page"
end

# sign up
get '/sign_up/:user/:password' do 
	user = params[:user]
	password = params[:password]

	users[user] = password

	users.to_s
end

# assigning a cookie to a user when they log in. they need to sign up first though!
get '/login/:user/:password' do 
	user = params[:user]
	password = params[:password]

	if users[user] == password
		response.headers["Set-Cookie"] = "user=#{params["user"]}; path=/;"
	else
		"You need to sign up!"
 end
end

# logout
get '/logout' do 
	response.delete_cookie("user")
	"You've been deleted."	
end

# greet users if logged in, if not logged in please tell them to do so
get '/greeting' do 

	if request.cookies["user"]
		"Hello #{request.cookies["user"]}, Account number: #{accounts[request.cookies["user"]]}"
	else
		"Please Sign-in so I can greet you!"
	end
end
