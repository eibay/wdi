require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/connection.rb'
require_relative './lib/album.rb'
require_relative './lib/category.rb'
require_relative './lib/client.rb'
require_relative './lib/photo.rb'

after do
  ActiveRecord::Base.connection.close
end
