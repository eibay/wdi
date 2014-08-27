require 'securerandom'
require 'json'
require 'pry'

class Shuttle
	def self.all()
		return JSON.parse(File.read("./shuttles.txt"))
	end


	def self.create(shutt)
		shuttles = self.all()

		shutt["id"] = SecureRandom.hex
		shuttles.push(shutt)

		shuttle_json = JSON.generate(shuttles)
		File.write("./shuttles.txt", shuttle_json)
	end


	def self.find_by(key, value)
		self.all().find do |shuttle|
			shuttle[key] == value
		end
	end


	def self.select_by(key, value)
		self.all().select do |shuttle|
			shuttle[key] == value
		end
	end
end


class Astronaut
	def self.all()
		return JSON.parse(File.read("./astronauts.txt"))
	end

	def self.create(astro)
		astronauts = self.all()

		astro["id"] = SecureRandom.hex
		astronauts.push(astro)
		astro_json = JSON.generate(astronauts)
		File.write("./astronauts.txt", astro_json)
	end 

	def self.find_by(key, value) 
		self.all().find do |astro|
			astro[key] == value
		end
	end

	def self.select_by(key, value)
		self.all().select do |astro|
			astro[key] == value
		end
	end
end















