require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative "libs/connection"
require "active_record"

use Rack::Session::Cookie, {
	:key => "rack.session",
	:path => "/",
	:secret => "yo_momma"
}


get ("/") do 
	erb(:index)
end 

# A user can sign up for a bank account with an email and a password.
post ("/users") do 
	user = User.create({
		email: params["email"],
		password: params["password"]
	})
	Account.create({
		user_id: user.id,
		balance: 0
	})
	return "New bank account created. Please login"
end 

# A user can sign in to their account
post ("/login") do 
	User.find_by(email: params["email"]) ? 
		if User.find_by(email: params["email"]).password == params["password"]
			
			user = User.find_by(email: params["email"])
			balance_array = user.accounts
			session["email"] = params[:email]
			erb(:bank_account, {locals: {user: user, balance_array: balance_array}})
		else
			return "This password is invalid"
		end 
	: "This user name is invalid"
end 

get ("/transactions") do 
	email = session["email"]
	user = User.find_by(email: email)
	account = user.accounts
	erb(:accounts, {locals: {account: account}})
end 

put ("/transactions") do 
	account_id = params["account_id"]
	account = Account.find(account_id)
	amount = params["amount"]
	if params["transaction"] == "withdrawl" && amount.to_i < account.balance
		remaining_balance = account.balance - amount.to_i
		account.update({balance: remaining_balance})
		erb(:balance, {locals:{remaining_balance: remaining_balance}})
	elsif params["transaction"] == "withdrawl" && amount.to_i > account.balance
		return "Insufficient funds"
	elsif params["transaction"] == "deposit"
		remaining_balance = account.balance + amount.to_i
		account.update({balance: remaining_balance})
		erb(:balance, {locals:{remaining_balance: remaining_balance}})
	end 
end 

get ("/users") do 
	email = session["email"]
	user = User.find_by(email: email)
	balance_array = user.accounts
	erb(:bank_account, {locals: {user: user, balance_array: balance_array}})
end 

get ("/logout") do 
	response.delete_cookie("rack.session")

	"You have logged out!"
end 



