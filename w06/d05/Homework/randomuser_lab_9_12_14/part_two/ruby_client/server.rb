require "pry"
require "sinatra"
require "sinatra/reloader"
require "json"
require "httparty"

fake_people = []

get "/" do

	users = fake_people[0..4]
	erb(:index, locals: { users: users })

end

post "/user/new" do

	user_json = HTTParty.get("http://127.0.0.1:2000/user/create")
	user = JSON.parse(user_json)
	user["comments"] = []
	user["id"] = fake_people.length
	fake_people << user
	redirect("/user/#{user["id"]}")

end

get "/user/:id" do

	user = fake_people.find { |faker| faker["id"] == params["id"] }
	erb(:user, locals: { user: user })

end

post "/user/:id/comment" do

	fake_people[params["id"].to_i]["comments"] << params["comment"]
	redirect("/user/params['id']")

end
