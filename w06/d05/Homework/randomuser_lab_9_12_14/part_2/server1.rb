require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'



# after do
#   ActiveRecord::Base.connection.close
# end


get("/") do #5 random users

  erb(:index)
end

get("/users/page_length") do #num of random users on a page
  page_length = params["page_length"]
binding.pry
 
   random_users = HTTParty.get("http://localhost:2000//users/page_length/" + page_length)
   random_users_hashes = JSON.parse(random_users)
   users_many.push(random_users_hashes)
 end

  erb(:many, { locals: { users_many: users_many } })
end

get("/user/:id") do 
  user_id = params["id"] 
  user = HTTParty.get("http://localhost:2000/user/user_id")
  user_hash = JSON.parse(user)

  erb(:one_user, { locals: { user_hash: user_hash } })
end










