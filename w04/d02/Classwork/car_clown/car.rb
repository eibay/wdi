require 'json'
require 'securerandom'
require 'pry'

class Car
	def self.all()
		return JSON.parse(File.read('./cars.txt'))
	end

	def self.create(car)
		car["car_id"] = SecureRandom.hex
		cars = self.all()
		cars << car
		File.write('./cars.txt', cars.to_json)
	end

	def self.find_by(key, value)
		self.all().find do |x|
			x[key] == value
		end
	end

	def self.select_by(key, value)
		self.all().select do |y|
			y[key] == value
		end
	end
end

