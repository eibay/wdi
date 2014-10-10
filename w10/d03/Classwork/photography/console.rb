require "HTTParty"
require 'pry'
require_relative './connection'
require_relative './models'



binding.pry

response = HTTParty.post("http://127.0.0.1:4567/albums", {
  body: {
    title: "yo",
     client_id: 1, 
     category_id: 1, 
     event_date: Date.new(2015,06,01)
     }})