require 'pry'
require 'HTTParty'
require 'JSON'
require_relative './lib/connection'
require_relative './lib/breed'



x = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=c88dbe9be3849b458890588c93d1a0c9&animal=dog&format=json&output=basic&breed=entlebucher")
# x = JSON.parse(x)
binding.pry