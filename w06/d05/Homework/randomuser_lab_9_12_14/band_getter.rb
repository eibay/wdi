require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require 'json'
require_relative './lib/connection'
require_relative './lib/band'

after do 
	ActiveRecord::Base.connection.close
end

# List 5 bands at a time (come from API in JSON)
# Have button that creates a new random band and then redirects to that band's page
# Each listed band should have a link to their page

get("/") do

end

