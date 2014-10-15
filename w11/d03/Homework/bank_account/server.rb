require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative './connection.rb'
require_relative './models.rb'

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'theapricotdanishisthebestthing'
}

get '/' do
	erb(:index)
end

# this is for login
post '/sessions' do
	users = User.all
	accounts = Account.all
	session[:email] = params[:email]
	session[:password] = params[:pwd]
	
	user = User.find_by(email: session[:email])

	if user[:password] == session[:password]

		account_id
		redirect "/accounts/#{params[:id]}"
binding.pry
	


end

# this is for signup
post '/users' do
	new_user = {
		:email => params[:email],
		:password => params[:pwd]
	}

	User.create(new_user)

	erb(:index)
end

# this is to edit balance
put '/accounts/:id' do

	erb(:account, { locals: { balance: balance } })
end

