require 'httparty'
require 'pry'



puts "put in the breed you would like to add"

breed=gets.chomp

HTTParty.post("http://127.0.0.1:4567", {:body => {:name => breed}})

puts "you have successfully added a breed"
