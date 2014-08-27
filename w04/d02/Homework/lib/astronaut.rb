require 'securerandom'
require 'json'


class Astronaut

	def self.all()
		return JSON.parse(File.read('./astronauts.txt'))
	end


	def self.create(astronaut)

		astronauts = all()
		astronaut["id"] = SecureRandom.hex

		astronauts.push(astronaut)
		File.write('./astronauts.txt', astronauts.to_json)
	end

	def self.find_by(key, value)
		astronauts  = self.all()
		astronauts.find do |astronaut|
			astronaut[key] == value
		end
	end

	def self.select_by(key, value)
		astronauts= self.all()
		astronauts.select do |astronaut|
			astronaut[key] == value
		end
	end
end
