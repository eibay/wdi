require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'

users = {}

get('/') do
	'Welcome to hell'	
end

get('/signup') do

	users[params[:user]] = params[:pass]
	users.to_s
end

get('/login/:user/:pass') do

	if users[params[:user]] == params[:pass]
		cookies[:user] = params[:user]
		"thanks for logging in #{params[:user]}"

	else
		'incorrect'
	end


end

get('/logout') do
	response.delete_cookie "user"
	"logged out"
end

get('/greeting') do
	if(cookies[:user])
		"hello #{cookies[:user]}"
	else
		'go login'
	end
end

