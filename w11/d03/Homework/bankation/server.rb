require "pry"
require "sinatra"
require_relative "./user"
require "sinatra/reloader"

user = User.new("yo@mama.com", "pass")

users = {user.email => user}

use Rack::Session::Cookie, {
	key: "session.rack",
	path: "/",
	secret: "stickemup"
}

get "/" do
	if session[:user]
		erb(:user, { locals: {user: users[ session[:user] ]} })
	else
		erb(:index)
	end
end


put "/user" do
	users[ session[:user] ].balance += params["credit"].to_i
	users[ session[:user] ].balance -= params["debit"].to_i
	redirect("/")
end

post "/user" do
	unless users[ params["email"] ]
		user = User.new(params["email"], params["password"])
		users[ params["email"] ] = user
		erb(:account_created)
	else
		erb(:bad_login)
	end

end

get "/user" do
	if users[ params["email"] ].password == params["password"]
		session[:user] = params["email"]
		erb(:user, { locals: {user: users[ params["email"] ]} })
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