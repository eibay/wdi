require 'json'

class Car
  def self.create(car)
    cars = self.all()
    cars.push(car)
    File.write('./cars.txt', cars.to_json)
  end

  def self.find_by(key, value)
    self.all().find do |car|
      car[key] == value
    end
  end

  def self.all()
    return JSON.parse(File.read('./car.txt'))
  end
end