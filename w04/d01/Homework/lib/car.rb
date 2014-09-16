require 'json'

class Car
  def self.create(car)
    cars = self.all()
    cars.push(car)
    cars_json = JSON.generate(cars)
    File.write('cars.txt', cars_json)
    return cars
  end

  def self.find_by(key, value)
    self.all().find do |car|
      car[key] == value
    end
  end

   def self.find_all(key, value)
    self.all().select do |student|
      student[key] == value
    end
  end  

  def self.all()
    return JSON.parse(File.read('cars.txt'))
  end
end