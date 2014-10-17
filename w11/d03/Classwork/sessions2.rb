# creating a sign up route
# it should be a get route that has two params in url, one for user and one for password
# insert params into hash we made with user as the key and password as the value

require 'sinatra'
require 'sinatra/reloader'

users = Hash.new

use Rack::Session::Cookie, {  
		:key => "rack.session",
		:path => "/",
		:secret => 'unlock'
}

accounts = {
	"jeff" => "098238201", 
	"ray" => "0823048209"
}


get '/' do 
	"Welcome to our page"
end


get '/sign_up/:user/:password' do 
	user = params[:user]
	password = params[:password]

	users[user] = password

	"Welcome #{params["user"]}!"
end


get '/login/:user/:password' do 
	user = params[:user]
	password = params[:password]

	if users[user] == password
		session[:user] = "#{params["user"]}"
		"Welcome #{params["user"]}, you are now logged in!"
	else
		"You need to sign up!"
 end
end


get '/logout' do 
	response.delete_cookie("rack.session") #this clears console
	# session.clear 
	# ^ this works too, but doesn't clear console
	"You've logged out!"	
end


get '/greeting' do 
	if session[:user]
		"Hello #{session[:user]}!, Account number: #{accounts[session[:user]]}"
	else
		"Please Sign-in"
	end
end
