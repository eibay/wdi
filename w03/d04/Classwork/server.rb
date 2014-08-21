require 'sinatra'
require 'pry'
require 'HTTParty'

get("/") do
	File.read("./views/index.erb")
end