require 'json'
require_relative ("./shuttle")

class Astronaut
	def self.all()
		return JSON.parse(File.read("./astronauts.txt"))
	end

	def self.new(name, rank, shuttle_id)
		astronauts = self.all()
		astro_id = SecureRandom.hex
		astronaut = {name: name, rank: rank, id: astro_id, shuttle: shuttle_id }
		astronauts << astronaut
		File.write("./astronauts.txt", astronauts.to_json)
	end

	def self.select(key, value)
		self.all().select {|astronaut| astronaut[key] == value }
	end
end