require 'securerandom'
require 'json'

class Astronaut 
	
	def self.create(astronaut)
		astronauts = self.all()

		astronaut["id"] = SecureRandom.hex
		astronauts.push(astronaut)

		astronauts_json = JSON.generate(astronauts)
		File.write('./astronaut.txt', astronauts_json)
	end

	def self.find_by(key, value)
		self.all().find do |x|
			x[key] == value
		end
	end

	def self.select_by(key, value)
		self.all().select do |x|
			x[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./astronaut.txt'))
	end
end

