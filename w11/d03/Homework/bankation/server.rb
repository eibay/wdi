require "pry"
require "sinatra"
require_relative "./connection"
require "sinatra/reloader"


ActiveRecord::Base.logger = Logger.new(STDOUT)

after do
	ActiveRecord::Base.connection.close
end

use Rack::Session::Cookie, {
	key: "session.rack",
	path: "/",
	secret: "stickemup"
}

get "/" do
	if session[:user]
		user = User.find_by( {email: session[:user]})
		erb(:user, { locals: {user: user} })
	else
		erb(:index)
	end
end


put "/user" do
	user = User.find_by( {email: session[:user]} )
	user.balance += params["credit"].to_i
	user.balance -= params["debit"].to_i
	user.save
	redirect("/")
end

post "/user" do
	unless User.find_by( {email: params["email"] })
		if params["password"] == params["password_conf"]
			user = User.create({email: params["email"], balance: 0, password: params["password"]})
			erb(:account_created)
		else
			erb(:password_conf_failed)
		end
	else
		erb(:bad_login)
	end

end

get "/user" do
	if User.find_by( { email: params["email"] } ).authenticate(params["password"])
		session[:user] = params["email"]
		user = User.find_by( { email: params["email"]})
		erb(:user, { locals: {user: user} })
	else
		erb(:bad_login)
	end
end

delete "/user" do
	response.delete_cookie("session.rack")
	redirect("/")
end


get "/pry" do
	binding.pry
end
