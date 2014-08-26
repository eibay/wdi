require 'json'
require 'securerandom'
require 'pry'

require_relative './car'

class Clowns
  def self.list()
    JSON.parse(File.read("./clown.txt"))
  end


  def self.add(clown)
    clown["id"] = SecureRandom.hex
    carshuffle = Cars.list.shuffle
    clown["carid"] = carshuffle[0]["id"]
    File.write("./clown.txt", clown.to_json)
  end
end
