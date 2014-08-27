require 'json'
require 'securerandom'
require 'pry'

class Clown
	def self.all()
		return JSON.parse(File.read('./clowns.txt'))
	end

	def self.create(clown)
		clown["id"] = SecureRandom.hex
		clowns = self.all()
		clowns << clown
		File.write('./clowns.txt', clowns.to_json)
	end

	def self.find_by(key, value)
		self.all().find do |x|
			x[key] == value
		end
	end

	def self.select_by(key, value)
		self.all().select do |y|
			y[key] == value
		end
	end
end
