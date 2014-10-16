require "sinatra"
require "sinatra/reloader"

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'schmee'
}

users = Hash.new


get("/") do 
	"Hello World"
end

get("/colors") do
	session[:color] = "blue"
	"Color was set"
end

get("/see_cookie") do 
	session[:color]
end

get("/signup/:user/:password") do
	users[params[:user]] = params[:password]
	"#{session[:user]} added"
end

get("/login/:user/:password") do
	if users[params[:user]] == params[:password]
		session[:user] = params[:user]
		session[:password] = params[:password]
		"login successful"
	else
		"Wrong login info"
	end
end

get("/logout") do
	response.delete_cookie("rack.session")
	"logout successful"
end

get("/greeting") do
	"hello #{session[:user]}"

end

