require 'sinatra/reloader'
require_relative './lib/comedian'

loop do
Comedian.question
end