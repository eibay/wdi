require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative "./lib/connection.rb"

use Rack::Session::Cookie, {
	:key => "rack.session",
	:path => "/",
	:secret => "banksy"
}

get("/") do
	erb(:index)
end

post "/accounts" do
	if params["password"] == params["confirm_password"]
		account = Account.create(email: params["email"], password: params["password"], account_balance: 0)
		erb(:show, {locals:{account: account}})
	else
		erb(:failed)
	end
end

post "/sessions" do
	account = Account.find_by(email: params["email"])
	if account.authenticate(params["password"]) != false
		erb(:show, {locals: {account: account} })
	else
		erb(:failed)
	end
end