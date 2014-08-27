require 'json'
require 'securerandom'

class Astronaut
	def self.all()
		return JSON.parse(File.read('./astronauts.txt'))
	end

	def self.create(astro)
		astronauts = self.all()
		astro["id"] = SecureRandom.hex
		astronauts << astro
		File.write('./astronauts.txt', astronauts.to_json)
	end

	def self.find_by(k, v)
		self.all().find do |x|
			x[k] == v
		end
	end

	def self.select_by(k, v)
		self.all().select do |y|
			y[k] == v
		end
	end
end