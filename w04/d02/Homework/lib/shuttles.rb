require 'securerandom'
require 'json'

class Shuttle

	def self.all()
		return JSON.parse(File.read('./shuttles.txt'))
	end

	def self.create(shuttle)

		shuttles = self.all()
		shuttle["id"] = SecureRandom.hex

		shuttles.push(shuttle)
		File.write('./shuttles.txt', shuttles.to_json)
	end

	def self.find_by(key, value)
		shuttles  = self.all()
		shuttles.find do |shuttle|
			shuttle[key] == value
		end
	end

end
