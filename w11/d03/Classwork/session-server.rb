require 'sinatra'
require 'sinatra/reloader'
require 'pry'

use Rack::Session::Cookie, {:key => 'rack.session',
:path => '/',
:secret => 'monkeybrains'
}


users = Hash.new

get '/' do 
	binding.pry
	if session[:user] != ""
	"Hello, #{session[:user]}"
else
	"Welcome to our page!"
end
end

get '/signup/:user/:password' do
	session[:user] = params[:user]
	session[:password] = params[:password]

	"you've signed up!"
end

get '/login/:user/:password' do 
binding.pry
	if session[:user] == params[:user] && session[:password] == params[:password]
		"you've logged in!"
	elsif session[:user] == params[:user] && session[:password] != params[:password]
		"wrong password"
	else
		"wrong user"
	end
end

get '/logout' do 
	session[:user].clear
	"you've logged out!"
end

get '/greeting' do

	if request.cookies["user"]
		"hello, #{request.cookies["user"]}"
	else
		"please login"
	end
end


