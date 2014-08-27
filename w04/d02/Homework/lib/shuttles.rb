require 'json'
require 'securerandom'

class Shuttle
	
	def self.create(shuttle)
	shuttles = self.all()
	
	shuttle["id"] = SecureRandom.hex
	shuttles.push(shuttle)
	
	shuttles_json = JSON.generate(shuttles)

	File.write('./shuttle.txt', shuttles_json)
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
		return JSON.parse(File.read('./shuttle.txt'))
	end
end