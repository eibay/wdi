require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'bcrypt'
require_relative './db/connection.rb'
require_relative './db/models.rb'

use Rack::Session::Cookie, { 
  :key => 'rack.session',
  :path => '/',
  :secret => 'Rick James'
}


get ('/') do
	error = ""
	logerror = ""
	erb(:index, locals: {signerror: error, logerror: logerror})
end

post ('/users') do

	logerror = ""
	if User.find_by(email: params[:email]) != nil
		signerror = "email already in use, please try again"
		erb(:index, locals: {signerror: signerror, logerror: logerror})
	else
	User.create(
		name: params[:name],
		email: params[:email],
		password: params[:password],
		balance: params[:balance])
	singerror="congrats!  you're signed up!"
erb(:index, locals: {signerror: singerror, logerror: logerror})
end
end

get ('/login') do 
	signerror = ""
	user = User.find_by(email: params[:email])
	if user.authenticate(params[:password]) == false
		logerror = "login not correct"
		erb(:index, locals: {signerror: signerror, logerror: logerror})
	else

		session[:user] = user.name
		session[:balance] = user.balance
		redirect "/transaction"
	end
end

get ('/transaction') do 
	if session[:user]
		x = "Hello #{session[:user]}, your balance is $#{session[:balance]}."
	end
	erb(:transaction, locals: {msg: x})
end

put ('/transaction') do 
	user = User.find_by(name: session[:user])
	newbalance = user.balance + params[:amount].to_i
	user.update(balance: newbalance)
	session[:balance] = newbalance
	redirect "/transaction"
end

get ('/logout') do 
	response.delete_cookie("rack.session")
	redirect "/"
end

