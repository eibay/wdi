require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require_relative './db/connection'
require_relative './lib/models'

use Rack::Session::Cookie, {
  :key => 'rack.session',
  :path => '/',
  :secret => 'shotaro'
		}
after do
  ActiveRecord::Base.connection.close
end


get '/' do 
  	erb(:index)
end

post '/signup' do
  	if User.find_by({email: params[:email]})
    	puts "username already exists"
    	redirect '/login'
  	else
    	User.create({
      		email: params[:email],
      		password: params[:password],
      		savings: params[:savings]
    	})
  	end
  	redirect '/'
end

get '/login' do
  	email = params[:email]
  	password = params[:password]
  	# if User.find_by( {email: email, password: password} )
   #  	puts "Hi #{email}"
   #  	user = User.find_by( {email: email, password: password} )
   #  	session[:id] = user.id
   #  	session[:email] = user.email
   #  	session[:password] = user.password
   #  	session[:savings] = user.savings
   #  	erb(:account, { locals: { user: user }})
  	# else
  	user = User.find_by(email: params[:email])
  	binding.pry
  	if user.authenticate(params[:password])
  	 	session[:id] = user.id
    	session[:email] = user.email
    	# session[:password] = user.password
    	session[:savings] = user.savings
    	erb(:account, { locals: { user: user }})
	else
		'Could not find. Try again.'
	end
end

put '/savings/:id' do
	user = User.find_by(id: params[:id])
	email = user.email
	savings = user.savings

	user.savings = params[:amount].to_i + savings.to_i
	user.save

	erb(:account, { locals: { user: user }})
end

get '/logout' do
  	session.clear

  	redirect '/'
end