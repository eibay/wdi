require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'faker'
require_relative './lib/connection'
require_relative './lib/user'

after do 
	ActiveRecord::Base.connection.close
end

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => '/',
	:secret => "strongenoughforamanbutmadeforawoman"
}

get ("/") do
	erb(:index)
end

post "/users" do
		login = params[:email_address]
    password = params[:password]
    user = User.find_by({email_address: login})
    if user 
      user.authenticate(password) 
      if user 
          session[:user] = user.email_address
          erb(:account, {locals: {user: user}})
      else
        erb(:index)
      end
    else
    erb(:index)
  end
end

post ("/user") do
	users = {
		name: params["name"],
		email_address: params["email_address"],
		password: params["password"],
		balance: params["balance"],
		account_number: Faker::Number.number(10)
	}

	all_users = User.create(users)

	erb(:index)
end

# post ("/user/:id/account") do
# 	user = User.find(params[:id])
# 	user.authenticate(params[:password])
# 	if user 
#       user.authenticate(password) 
#       if user && session[:user] == user.email_address
# 		erb(:account, { locals: { user: user } })
# 	else
# 		"You are not authorized to view this page."
# 		end
# 	end
# end

put ("/user/:id/account") do
	user = User.find(params[:id])
	if session[:user] == user.email_address
	if params[:debit] 
		user.update({balance: user.balance - params[:debit].to_i})
		erb(:account, { locals: { user: user } })
	elsif params[:credit]
		user.update({balance: user.balance + params[:credit].to_i})
		erb(:account, { locals: { user: user } })
	end
	else
		erb(:index)
	end
end

delete ("/user/:id/account") do
	user = User.find(params[:id])
	user.destroy
	"Sorry to see you go."
end

get ("/logout") do
	response.delete_cookie("rack.session")
	"<h1>You have successfully logged out.</h1>"
end	