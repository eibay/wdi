require 'sinatra'
require 'sinatra/reloader'
require 'pry'

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'monkeybranins' ##This is just for signing process
}

Users = Hash.new

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
		"Hello #{session[:user]}! Your account number is: #{accounts[:user]}"
	else
		"Please log in!"
	end
end


