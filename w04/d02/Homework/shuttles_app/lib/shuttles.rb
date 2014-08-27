require 'json'
require 'securerandom'

class Shuttle
	def self.all()
		return JSON.parse(File.read('./shuttles.txt'))
	end

	def self.create(shuttle)
		shuttles = self.all()
		shuttle["id"] = SecureRandom.hex
		shuttles << shuttle
		File.write('./shuttles.txt', shuttles.to_json)
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