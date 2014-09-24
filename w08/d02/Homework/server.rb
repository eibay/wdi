require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'kramdown'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/shirt'


after do
  ActiveRecord::Base.connection.close
end

get("/") do #shows the tshirts

  erb(:index, { locals: { shirts: Shirt.all() } })
end







