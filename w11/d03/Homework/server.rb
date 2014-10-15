require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection({
	:adapter => "postgresql",
	:host => "localhost",
	:username => "Conor",
	:database => "bank_account"
	})

ActiveRecord::Base.logger = Logger.new(STDOUT)


use Rack::Session::Cookie, {
	:key => 'rack_session',
	:path => '/',
	:secret => 'password'
}

class User < ActiveRecord::Base
end


get('/') do
	erb(:index, {locals:{session:session}})
end

get('/signup') do
	erb(:signup)
end

post('/signup') do
	if(User.find_by(email: params[:email]) != nil) 
		'You have already signed up'
	else
		User.create({name:params[:name], email:params[:email], password: params[:password], balance:0})
		redirect '/'
	end
end

post('/login') do
	if(User.find_by(email: params[:email]) != nil) 
		user = User.find_by(email: params[:email])
		if(user.password == params[:password])
			session[:user] = user.email
			session[:id] = user.id
			session[:name] = user.name
			redirect "/users/#{user.id}"
		else
			'Incorrect Password'
		end
	else
		'That user does not exist, plese go sign up'
	end
end


get('/users/:id') do
	
	user = User.find(params[:id])
	if(session[:id]==user.id)
		erb(:account, {locals:{user:user}})
	else
		'This is not your account'
	end

end
put('/users/:id') do
	user = User.find(params[:id])
	if(session[:id]==user.id)
		user.balance = params[:balance]
		user.save
		redirect "/users/#{user.id}"
	else
		'You can\'t update this account because it is not yours'
	end
end

get('/logout') do
	session.clear
	redirect '/'
end












	