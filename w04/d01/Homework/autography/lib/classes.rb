require 'json'
require 'pry'
require 'httparty'

class Cars

	def self.all
		JSON.parse(File.read("./cars.txt"))
	end

	def self.create(car)
		cars = self.all
		cars.push(car)
		json_cars = JSON.generate(cars)
		File.write("./cars.txt", json_cars)
	end

	def self.find_by(key, value)
		self.all.find {|car| car[key].downcase == value}
	end

	def self.find_all_by(key, value)
		self.all.select {|car| car[key].downcase == value}
	end

end

class Mechanics

	def self.all
		JSON.parse(File.read("./mechanics.txt"))
	end

	def self.create(mechanic)
		mechanics = self.all
		mechanics.push(mechanic)
		json_mechanics = JSON.generate(mechanics)
		File.write("./mechanics.txt", json_mechanics)
	end

	def self.find_by(key, value)
		self.all.find {|mechanic| mechanic[key].downcase == value}
	end

	def self.find_all_by(key, value)
		self.all.select {|mechanic| mechanic[key].downcase == value}
	end

	def self.add_random
		response = HTTParty.get("http://api.randomuser.me")
		possible_cars = ["AMC Gremlin", "Volkswagen Golf", "Mercedes SuperDiesel", "BMW LSomething", "Karmann Ghia", "Subaru Outback", "Toyota Avalon"]
		person = {
			"name" => "#{response['results'][0]['user']['name']['first'].capitalize} #{response["results"][0]["user"]["name"]["last"].capitalize}",
			"age" => (Time.now.strftime("%Y").to_i - Time.at(116328003).strftime("%Y").to_i).to_s,
			"car" => possible_cars[rand(0..(possible_cars.length - 1))],
			"image" => response["results"][0]["user"]["picture"],
			"mechanic" => "none"
		}
		self.create(person)
	end

end







