# used to encrypt cookies
# signature and cookie is sent to the server and it gets decrypted with the secret 
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

use Rack::Session::Cookie, {  
		:key => "rack.session",
		:path => "/",
		:secret => 'unlock' #secret
}

get "/" do 
	"Hello #{session[:name]}"
end

get "/colors" do 
	session[:color] = "orange" #cookie
	
	"Color was set"
end

get "/record/:name" do 
	session[:name] = params[:name]
	'Recorded!'
end