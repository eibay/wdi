require 'pry'
require 'json'

class Car
	def self.all()
		return JSON.parse(File.read('./cars.txt'))
	end

	def self.create(car)
		cars = self.all()
		    car["id"] = SecureRandom.hex
		cars.push(car)
		cars_json = JSON.generate(cars)
		File.write('./cars.txt', cars_json)
	end












end