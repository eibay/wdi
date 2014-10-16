require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

require './db/connection.rb'
require './lib/model.rb'

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'unlock'
}

after do
	ActiveRecord::Base.connection.close
end

get '/' do
	erb(:index)
end

get '/signup' do
	erb(:sign_up)
end

post '/signup' do
	Account.create({
		name: params[:name],
		email: params[:email], 
		password: params[:password], 
		bank_account: 0 
	})
	
	redirect '/'
	puts "Welcome!"
end

get '/login' do 
	erb(:index)
end

get '/users' do
	accounts = Account.all()

	accounts.each do |person|
		if person.email == params[:email] && person.password == params[:password]
			session[:name] = person.email
			redirect "/users/#{person.id}"
		else
			puts "Not an authorized user."
		end
	end
	redirect '/'
end

get '/users/:id' do
	account = Account.find(params[:id])
	
		if session[:name] == account.email
			erb(:account, {locals: {account: account} })
		else 
			puts "Not an authorized user."
		end
end

put '/users/:id' do
	account = Account.find(params[:id])
		
	checking = params[:checking]
	account.update({bank_account: account.bank_account + params[:checking].to_i})
	
	redirect "/users/#{account.id}"
end

get '/logout' do
	response.delete_cookie('rack.session')
	redirect '/'
end