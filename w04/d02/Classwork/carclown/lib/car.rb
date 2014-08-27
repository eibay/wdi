require 'json'
require 'securerandom'
require 'pry'

class Cars
  def self.list()
    JSON.parse(File.read("./car.txt"))
  end

  def self.create()
    

  def self.add(car)
    car["id"] = SecureRandom.hex
    File.write("./car.txt", car.to_json)
  end
end
