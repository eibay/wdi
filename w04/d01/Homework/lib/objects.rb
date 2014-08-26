require 'json'

class Mech
	def self.all()
		return JSON.parse(File.read('./mechanics.txt'))
	end

	def self.create(mechanic)
		mechanics = self.all()
		mechanics << mechanic
		File.write('./mechanics.txt', mechanics.to_json)
	end

	def self.find_by(key, value)
		self.all().find do |x|
			x[key] == value
		end
	end
end

class Car
	def self.all()
		return JSON.parse(File.read('./cars.txt'))
	end

	def self.create(car)
		cars = self.all()
		cars << car
		File.write('./cars.txt', cars.to_json)
	end

	def self.find_by(key, value)
		self.all().find do |x|
			x[key] = value
		end
	end
end