require 'json'

class Car
	def self.create(car)
		cars = self.all()
		cars.push(car)
		car_json = JSON.generate(cars)
    	File.write('./cars.txt', car_json)
	end

	def self.find_by(key, value)
		self.all().find do |x|
			x[key] == value
		end
	end

	def self.all ()
    	return JSON.parse(File.read('./cars.txt'))
		end
	end