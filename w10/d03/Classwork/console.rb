require 'pry'
require_relative './lib/connection'
require_relative './lib/client'
require_relative './lib/photo'
require_relative './lib/album'
require_relative './lib/category'

binding.pry

response = HTTParty.post("http://127.0.0.1:4567/albums", {
  body: {
    title: "Birthday",
    client_id: 1, 
    category_id: 2, 
    event_date: Date.new(2015,06,01)
    }})