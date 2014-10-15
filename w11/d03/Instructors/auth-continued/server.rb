require 'sinatra'
require 'sinatra/reloader'

use Rack::Session::Cookie, { 
  :key => 'rack.session',
  :path => '/',
  :secret => 'icouldmakethisanaythingiwantto'
}

users = Hash.new

accounts = {
	"jeff" => "1kaskdjasd989",
	"neel" => "deathstart1234q3s"
}

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
		# response.headers["Set-Cookie"] = "user=#{params["user"]}; path=/;"
		session[:user] = params[:user]
		"You have logged in!"
	else
		"Try again!"
	end
end

get '/logout' do
	response.delete_cookie("rack.session")

	"You have logged out!"
end

get '/greeting' do
	if session[:user]
		"Hello #{session[:user]}! Your account number is: #{accounts[session[:user]]}"
	else
		"Please log in!"
	end
end


