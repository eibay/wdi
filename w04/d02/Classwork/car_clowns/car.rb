require 'securerandom'
require 'json'

class Car
  def self.create(car)
    cars = self.all()

    car["id"] = SecureRandom.hex
    cars.push(car)

    cars_json = JSON.generate(cars)
    File.write('./cars.txt', cars_json)
  end

  def self.find_by(key, value)
    self.all().find do |car|
      car[key] == value
    end
  end

  def self.select_by(key, value)
    self.all().select do |car|
      car[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./cars.txt'))
  end
end