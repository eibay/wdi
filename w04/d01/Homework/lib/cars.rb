require 'json'
require 'pry'

class Car
	def self.all()
		return JSON.parse(File.read("./cars.txt"))
	end

	def self.create(car)
		cars = self.all()
		cars << car
		File.write("./cars.txt", cars.to_json)
	end

	def self.find_by(key, value)
		self.all().select { |car| car[key] == value }
	end
end