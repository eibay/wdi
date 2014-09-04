require 'pry'
require 'active_record'
require_relative './lib/connection'
require_relative './lib/dog'

Dog.create({
  breed_name: "Poodle", 
  pic_url: "https://images.akc.org/breeds/action_images/poodle.jpg"
})

Dog.create({
  breed_name: "Boxer",
  pic_url: "http://www.dogbreedinfo.com/images8/Greta.jpg"
})

