require 'json'

class Car

	def self.create(car)
	  cars.push(car)
	  cars_json = JSON.generate(students)
	  File.write('./cars.txt', cars_json)
	end

	def self.find_by(key,value)
		self.all() do |


