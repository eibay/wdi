require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/connection'
require_relative './lib/user'

use Rack::Session::Cookie, { 
  :key => 'rack.session',
  :path => '/login_form',
  :secret => 'icouldmakethisanaything'
}


get('/') do
	"Welcome to our page!"
end

get('/sign_up') do

	puts "Customer is signing up"

	erb(:account_new)
end

post('/sign_up') do

	new_user = User.create({
    email: params[:email],
    password: params[:password],
    balance: params[:deposit]
  })

 redirect '/login_form'
end

get('/login_form') 
	erb(:welcome)
end

get('/login') do
session[:email] = params[:email]
session[:password] = params[:password]
	the_user = User.find_by(email: params[:email])

	binding.pry



	if the_user.password == params[:password]
		session[:email] = params[:email]
		"You have logged in!"
	else
		"Try again!"
	end
end

get('/logout') do
	response.delete_cookie("rack.session")

	puts "User has logged out!"
	"You have logged out"
end

get('/greeting') do
	if session[:user]
		"Hello #{session[:user]}! Your account number is: #{accounts[session[:user]]}"
	else
		"Please log in!"
	end
end


