require 'sinatra'
require 'sinatra/reloader'
require 'pry'


# its sets up sessions, this tamperproof cookie session, it configures
# "session" means set up tamperproof cookie
# What is a session hash?

use Rack::Session::Cookie, { 
  :key => 'rack.session',
  :path => '/',
  :secret => 'monkeybrains'
}

users = Hash.new

accounts = {
	"jeff" => "1kaskdjasd989",
	"neel" => "deathstart1234q3s"
}

get '/' do
	"Hello, #{session[:name]} "
end

get '/sign_up/:user/' do


	# users[ params[:user] ] = params[:password]

	"You have signed up!"

	# puts users
end

get '/record/:name' do
  session[:name] = params[:name]
  'Recorded!'
  'You are logged in'
end


get '/logout' do
	response.delete_cookie("user")

	"You have logged out!"
end

get '/greeting' do
	if request.cookies["user"]
		"Hello #{request.cookies["user"]}! Your account number is: #{accounts[request.cookies["user"]]}"
	else
		"Please log in!"
	end
end


