require 'sinatra'
require 'pry'
# load 'emails.rb'

people = []

get "/" do
  erb(:index)
end

post "/emails" do
  people[params["email"]] = [params["first"], params["last"]]

  erb(:emails, { locals: {people: people} })
end

get "/emails" do
  erb(:emails, { locals: {people: people}})
end
