require 'pry'
require_relative './lib/connection'
require_relative './lib/dog'

Dog.delete_all 

response = HTTParty.get('http://api.petfinder.com/pet.getRandom?key=1d05e5ee14eca9c51dbc9e4ca9bb99bd&animal=dog&breed=labrador&format=json')
imageid = response["petfinder"]["petIds"]["id"]["$t"]


