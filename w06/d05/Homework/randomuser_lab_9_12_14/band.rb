require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'



# after do
#   ActiveRecord::Base.connection.close
# end

get("/") do #5 random users

    random_user = HTTParty.get("http://localhost:2000/user/create")
    random_user_info = random_user["results"][0]["id"]




    random_user_hash = {
      id: random_user_info["name"]["first"], 
      name: random_user_info["name"]["last"], 
      gender: random_user_info["gender"], 
      city: random_user_info["location"]["city"], 
      state: random_user_info["location"]["state"]
    }

  end

  erb(:index, { locals: { thing: thing } })
end










