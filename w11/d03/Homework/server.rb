require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require_relative './lib/connection'
require_relative './lib/account'

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'tongue'
}

after do
	ActiveRecord::Base.connection.close
end

userAccount = true

get '/' do
	erb(:index, { locals: {userAccount: userAccount}})
end

get '/signup' do
	erb(:signup)
end

post '/signup' do
	Account.create({email: params[:email], password: params[:password], balance: 0 })
	redirect '/'
end

get '/login' do 
	erb(:login)
end

get '/users' do
	accounts = Account.all()
	accounts.each do |account|
		if account.email == params[:email] && account.password == params[:password]
			session[:name] = account.email
			redirect "/users/#{account.id}"
		end
	end
	userAccount = false
	redirect '/'
end

get '/users/:id' do
	account = Account.find(params[:id])
	if session[:name] == account.email
		erb(:account, {locals: {account: account}})
	else 
		'Invalid User'
	end
end

put '/users/:id' do
	account = Account.find(params[:id])
	if params[:debit] 
		account.update({balance: account.balance - params[:debit].to_i})
		redirect "/users/#{account.id}"
	elsif params[:credit]
		account.update({balance: account.balance + params[:credit].to_i})
		redirect "/users/#{account.id}"
	end
end

get '/logout' do
	response.delete_cookie('rack.session')
	userAccount = true
	redirect '/'
end
