require 'sinatra'
require 'sinatra/reloader'

use Rack::Session::Cookie, {
	:key => 'rack_session',
	:path => '/',
	:secret => 'password'
}

users = {}

def logged_in?
	if session[:user] != nil
		return true
	else
		return false
	end
end

def session.start
	session[:session] = true
end

def session?
	return session[:session]
end

def session.destroy
	session.clear
end



get('/') do
	'Welcome to hell'	
end

get('/signup') do

	users[params[:user]] = params[:pass]
	'signed up'
end

get('/login/:user/:pass') do

	if users[params[:user]] == params[:pass]
		session[:user] = params[:user]
		"thanks for logging in #{session[:user]}"

	else
		'incorrect'
	end


end

get('/logout') do
	session.clear
	"logged out"
end

get('/greeting') do
	if(logged_in?)
		"hello #{session[:user]}"
	else
		'go login'
	end
end

