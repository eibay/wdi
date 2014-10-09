require 'pry'
require_relative './lib/connection'
require_relative './lib/child'
require_relative './lib/book'
require_relative './lib/status'

binding.pry

response = HTTParty.post("http://127.0.0.1:4567/books", {
  body: {
    title: "The Chocolate War" 
    }})