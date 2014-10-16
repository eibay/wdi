require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/connection.rb'
require_relative './lib/user.rb'

after do 
	ActiveRecord::Base.connection.close
end

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => 'banksecrets'
}

get '/' do
	erb(:index)
end

get '/signup' do
	erb(:signup)
end

post '/signup' do
	user = { 
		name: params[:name], 
		email: params[:email],
		password: params[:password],
		savings: params[:savings]
		}
	User.create(user)
	session[:name] = params["email"]
	redirect '/'
end

post '/signin' do
	user = User.find_by(email: params[:email])
	if user.password == params[:password]
		session[:email] = user.email
		session[:id] = user.id
		session[:name] = user.name
	else
		alert("wrong password, try agin")
	end

end

get '/users/:id' do
	user = User.find(params[:id])
	if session[:id] == user.id
		erb(:useraccount, {locals:{user:user} })
	else
		alert("You don't have access to this account.")
	end
end

put '/users/:id' do 
	user = User.find(params[:id])
	if params["debit"] == ""
		user.savings = user.savings - params["credit"].to_i
		user.save
	elsif params["credit"] == ""
		user.savings = user.savings + params["debit"].to_i
		user.save
	end
	redirect "/users/#{user.id}"
end

get '/logout' do
	response.delete_cookie("rack.session")
	redirect '/'
end









