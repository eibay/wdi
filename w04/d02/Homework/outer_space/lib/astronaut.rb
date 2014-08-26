require 'json'
require 'securerandom'
require 'pry'


class Astronaut

	def self.all
		JSON.parse(File.read("./astronauts.txt"))
	end

	def self.create(astronaut)
		astronaut["id"] = SecureRandom.hex
		staff = self.all
		staff << astronaut
		staff_json = JSON.generate(staff)
		File.write("./astronauts.txt", staff_json)
	end

	def self.find_by(key, value)
		staff = self.all
		all.find do |astronaut|
			astronaut[key] == value
		end
	end

	def self.select_by(key, value)
		staff = self.all
		all.select do |astronaut|
			astronaut[key] == value
		end
	end


end