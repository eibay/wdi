require 'json'
require 'securerandom'
require 'httparty'
require 'pry'

class Car
	def self.all()
		return JSON.parse(File.read("./car.txt"))
	end

	def self.create()
		cars = self.all()
		colors = ["Red", "Blue", "Grey", "Silver", "Black", "Green", "Purple", "Yellow", "Orange", "White"]
		milage = (0..250000).to_a.sample
		capacity = [4, 6, 8, 10].sample
		car_id = SecureRandom.hex
		car = { id: car_id, color: colors.sample, milage: milage, capacity: capacity }
		cars << car
		File.write("./car.txt", cars.to_json)
	end

	def self.find_by(key, value)
		self.all().find do |car|
			car[key] == value
		end
	end
end

class Clown
	def self.all()
		return JSON.parse(File.read("./clown.txt"))
	end

	def self.create(id, name, shoe_size, car)
		clowns = self.all()
		clown_id = SecureRandom.hex
		clown = {id: clown_id, name: name, shoe_size: shoe_size, car: car_id}
		clowns << clown 
		File.write("./clown.txt", clowns.to_json)
	end

	def self.select_by(key, value)
		self.all().select do |clown|
			clown[key] ==  value
		end
	end
end

20.times do
		rand_person = HTTParty.get('http://api.randomuser.me/')
		name = rand_person["results"][0]["user"]["name"]["first"].capitalize
		shoe_size = ["XL", "XXL", "XXXL", "XXXXL"].sample
		cars = Car.all()
		car = cars.sample		
		car_id = car["id"]
		Clown.create(id, name, shoe_size, car_id)
end

binding.pry
