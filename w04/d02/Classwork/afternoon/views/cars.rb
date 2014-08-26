require 'json'
require 'securerandom'

class Cars

	def self.create (car)
		cars = self.all()
		cars.push(car)
		cars_json = JSON.generate(cars)
		File.write('./cars.txt')
	end

	def self.select_by(key,value)
		self.all().select do |car|
			car[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./dorms.txt'))
	end
end

