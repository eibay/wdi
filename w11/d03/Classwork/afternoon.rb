require 'sinatra'
require 'sinatra/reloader'

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'monkeybrains'
}

get "/" do 
	"Hello #{session[:name]}!"
end

get "/colors" do
	session[:color] = "orange"
	# sets the cookie - Rack Session Cookie
	"Color was set"
end

get "/record/:name" do
	session[:name] = params[:name]
	"Recorded"
end	

