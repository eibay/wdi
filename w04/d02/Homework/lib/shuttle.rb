require 'json'
require 'securerandom'

class Shuttle
	def self.all()
		return JSON.parse(File.read("./shuttles.txt"))
	end

	def self.new(name, origin_country, destination)
		shuttles = self.all()
		shuttle_id = SecureRandom.hex
		shuttle = {name: name, orig: origin_country, dest: destination, id: shuttle_id }
		shuttles << shuttle
		File.write("./shuttles.txt", shuttles.to_json)
	end

	def self.find(key, value)
		self.all().find { |shuttle| shuttle[key] == value }
	end
end