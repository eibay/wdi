require 'sinatra'
require 'httparty'

get "/" do

  user = HTTParty.get("http://localhost:2000")

  erb(:index, locals: {user: user})
end
