require 'pry'
require 'json'
require 'securerandom'

class Car
  def self.create(car)
  car["id"] = SecureRandom.hex
  cars = self.all()
  cars.push(car)
  cars_json = JSON.generate(cars)
  File.write("./cars.txt", cars_json)
  end

def self.find_by(k, v)
  self.all().find do |car|
    car[k] == value
  end
end

def self.select_by(k, v)
  self.all().select do |car|
    car[k].downcase == value.downcase
  end
end

def self.all()
  return JSON.parse(File.read("./cars.txt"))
  end
end

binding.pry








