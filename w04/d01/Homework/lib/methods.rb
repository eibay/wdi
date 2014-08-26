require 'json'
require 'pry'

class Mechanic
	def self.all()
		return JSON.parse(File.read('./mechanic.txt'))
	end

	def self.find_by(key, value)
		self.all().find do |mech|
			mech[key] == value
		end
	end 


	def self.create(mech)
		mechanics= self.all()
		mechanics.push(mech)
		mechanic_json = JSON.generate(mechanics)
		File.write('./mechanic.txt', mechanic_json)
	end
end


class Car
	def self.all()
		return JSON.parse(File.read('./car.txt'))
	end

	def self.find_by(key, value)
		self.all.find do |car|
			car[key] == value
		end
	end

	def self.create(car)
		cars = self.all()
		cars.push(car)
		car_json = JSON.generate(cars)
		File.write('./car.txt', car_json)
	end
end