require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'



# after do
#   ActiveRecord::Base.connection.close
# end

get("/") do #5 random users
  users_five = []

  5.times do
    random_user = HTTParty.get("http://localhost:2000/user/create")
    random_user_hash = JSON.parse(random_user)
    users_five.push(random_user_hash)
  end

  erb(:index, { locals: { users_five: users_five } })
end










