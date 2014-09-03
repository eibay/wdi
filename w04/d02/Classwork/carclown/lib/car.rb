require 'json'
require 'securerandom'
require 'pry'


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

	def self.all()
		return JSON.parse(File.read('./cars.txt'))
	end
end

class Clown
	def self.create(clown)
		clowns = self.all()

		clown["id"]= SecureRandom.hex
		clowns.push(clown)
		clowns_json = JSON.generate(clowns)
		File.write('./clowns.txt', clowns_json)
	end

	def self.find_by(key, value)
		self.all().find do |clown|
			clown[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./clowns.txt'))
	end
end

binding.pry