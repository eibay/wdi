require 'JSON'
require 'securerandom'

class Car
	def self.create(car)
		cars = self.all()
		cars.push(car)
		cars_json = JSON.generate(cars)
		File.write('./car.txt')
	end

	def self.select_by(key, value)
		self.all().select do |car|
			car[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./car.txt'))
	end
end

class Clown
	def self.create(clown)
		clowns= self.all()
		clowns.push(clown)
		clowns_json = JSON.generate(clowns)
		File.write("./clown.txt")
	end

	def self.select_by(key, value)
		self.all().select do |clown|
			clown[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./clown/txt'))
	end
end 