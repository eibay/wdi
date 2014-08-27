require 'pry'
require 'json'
require 'securerandom'

class Car
def self.all()
	return JSON.parse(File.read('./car.txt'))
end


def self.add(car)
	cars = all()
	cars.push(car)
	File.write('./car.txt', cars.to_json)

end

end
