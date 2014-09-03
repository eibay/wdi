require 'httparty'
require_relative '../lib/connection'
require_relative '../lib/breed'
require 'pry'
# require 'sinatra'
require 'active_record'

puts Breed.all + "\n"

puts "What dog do you want to delete"
resp = gets.chomp

breed_to_delete = Breed.find_by({breed: resp})

HTTParty.delete("http://127.0.0.1:4567/breed/:id", {:body => {:id => breed_to_delete[:id]}})



