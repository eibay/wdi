require 'sinatra'
require 'sinatra/reloader'
require 'pry'



use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'thiscanbeanything'

	} 
	# sets up a session
	# sets key/cookie path/ and secret used to create a signature


get '/' do
	 "Welcome to our page #{session[:name]}!"
end


get '/sign_up/:user/:password' do
	users[ params[:user] ] = params[:password]
	
	"You have signed up"
end
	

get '/login/:user/:password' do

	if users[ params[:user] ] == params[:password]
	# response.headers["Set-Cookie"] = "user=#{params["user"]}; path=/;"
		session [:user] = params[:user]
		"you have logged in"
	else
		"No Cooooookies for uuu"
	end
end

get '/logout' do
	response.delete_cookie("rack.session")
	"you have logged out!"	
end

get '/greeting' do
	if session[:user]
		"Helllowww #{session[:user]}! Your account number is: #{accounts[session[:user]]}"
	else
		"you still haven't loooged in"
	end
end

# binding.pry
