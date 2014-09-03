require 'json'
require 'httparty'
require 'pry'

class Mechanic
	def self.all()
		return JSON.parse(File.read("./mechanics.txt"))
	end

	def self.create(mechanic)
		mechanics = self.all()
		mechanics << mechanic
		File.write("./mechanics.txt", mechanics.to_json)
	end

	def self.find_by(key, value)
		self.all().find { |mechanic| mechanic[key].downcase == value.downcase }
	end

	def self.auto()
		rand_person = HTTParty.get('http://api.randomuser.me/')
		name = rand_person["results"][0]["user"]["name"]["first"].capitalize
		age = (18..80).to_a.sample
		cars = ["Mustang", "Porsche", "Jaguar", "Maserati", "Aston Martin", "Mercededs", "Corvette", "Ferrari", "Alpha Romeo", "Dodge", "Lamborghini", "Toyota", "Chevrolet", "Datsun"]
		fave_car = cars.sample
		picture = rand_person["results"][0]["user"]["picture"] 

		mechanic = {name: name, age: age, fave_car: fave_car, picture: picture}
		mechanics = self.all()
		mechanics << mechanic
		File.write("./mechanics.txt", mechanics.to_json)
		return 
	end
end