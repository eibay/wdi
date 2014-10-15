require 'sinatra'
require 'sinatra/reloader'

# Configures a session. The hash becomes a tamper-proof cookie.
use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'monkeybrains'
}

users = Hash.new

get "/signup/:user/:password" do
# should be a post route, really
# sign up is not connected to session
	users[params[:user]] = params[:password]

	"You have signed up"

	users.to_s

end

get "/login/:user/:password" do

	if users[params[:user]] == params[:password]
		session[:user] == users[params[:user]]
		"You have logged in."
	else
		"Ooops! Wrong password!"
	end

end

get "/logout" do
	response.delete_cookie("rack.session")
	"You have successfully logged out."
end

get "/greeting" do
	if session[:user]
		"Hello, #{session[:user]}!"
	else
		"Please log in."
	end
end
