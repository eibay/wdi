require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'securerandom'

class Car
	def self.all()
		return JSON.parse(File.read('../cars.txt'))
	end

	def self.create
		cars = Car.all()

		car["id"] = SecureRandom.hex
		cars.push(car)

		cars_json = JSON.generate(cars)
		Filr.write('../cars.txt', cars_json)
	end

	def self.find_by(key, value)
    	self.all().find do |car|
      	car[key] == value
      	end
    end
end

class Clown
	def self.all()
		return JSON.parse(File.read('../clowns.txt'))
	end

	def self.create
		clowns = Clown.all()

		clown["id"] = SecureRandom.hex
		clowns.push(clown)

		clowns_json = JSON.generate(clowns)
		Filr.write('../clowns.txt', clowns_json)
	end

	def self.find_by(key, value)
    	self.all().find do |clown|
      	clown[key] == value
      end
    end
end

binding.pry

# car = {}
# clown = {}

# puts "Cars color?"
# car["color"] = gets.chomp.downcase
# puts "Cars mileage?"
# car["mileage"] = gets.chomp.downcase
# puts "Cars capacity?"
# car["capacity"] = gets.chomp.downcase
# car["car_id"] = SecureRandom.hex

# puts "Clowns name?"
# clown["name"] = gets.chomp.downcase
# puts "Clowns name?"
# clown["name"] = gets.chomp.downcase
# puts "Clowns name?"
# clown["name"] = gets.chomp.downcase
# puts "Clowns name?"
# clown["name"] = gets.chomp.downcase








