require 'json'

class Car
  def self.all()
    cars = JSON.parse(File.read('./cars.txt'))
    return cars
  end

  def self.create(hash)
    cars


end
