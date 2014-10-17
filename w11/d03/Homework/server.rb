require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'bcrypt'
require_relative './lib/connection'
require_relative './lib/user'

use Rack::Session::Cookie, { 
  :key => 'rack.session',
  :path => '/',
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
    password_digest: params[:password],
    balance: params[:deposit]
  })

 redirect '/login_form'
end

get('/login_form') 
	erb(:welcome)
end

post('/sessions') do

	the_user = User.find_by(email: params[:email])

	if the_user.authenticate(params[:password]) == true
		session["email"] = params[:email]
		erb(:main, { locals: { the_user: the_user } })
	else
		return "try again"
	end
end

put('/dep_withd') do
	the_user = User.find_by(email: session["email"])

	if params[:deposit] != nil
		blah
	elsif params[:withdrawl] != nil
		blah
	else
		blah
	end

	binding.pry
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


