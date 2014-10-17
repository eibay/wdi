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

get "/users" do
	users = User.all()

	users.each do |user|
		if user.email_address == params[:email_address] && user.password == params[:password]
			session[:user] = user.email_address
			redirect "/user/#{user.id}/account"
		else
			puts "You are not authorized to view this page."
		end
	end
end

post ("/users") do
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

get ("/user/:id/account") do
	user = User.find(params[:id])
	if session[:user] = user.email_address
		erb(:account, { locals: { user: user } })
	else
		"You are not authorized to view this page."
	end
end

put ("/user/:id/account") do
	user = User.find(params[:id])
	if params[:debit] 
		user.update({balance: user.balance - params[:debit].to_i})
		erb(:account, { locals: { user: user } })
	elsif params[:credit]
		user.update({balance: user.balance + params[:credit].to_i})
		erb(:account, { locals: { user: user } })
	end
end

delete ("/user/:id/account") do
	user = User.find(params[:id])
	user.destroy
	"Sorry to see you go."
end

get ("/logout") do
	response.delete_cookie("rack.session")
	"You have successfully logged out."
end	