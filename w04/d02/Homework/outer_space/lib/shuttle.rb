require 'json'
require 'securerandom'
require 'pry'


class Shuttle

	def self.all
		JSON.parse(File.read("./shuttles.txt"))
	end

	def self.create(shuttle)
		shuttle["id"] = SecureRandom.hex
		fleet = self.all
		fleet << shuttle
		fleet_json = JSON.generate(fleet)
		File.write("./shuttles.txt", fleet_json)
	end

	def self.find_by(key, value)
		fleet = self.all
		fleet.find do |shuttle|
			shuttle[key] == value
		end
	end

	def self.select_by(key, value)
		fleet = self.all
		fleet.select do |shuttle|
			shuttle[key] == value
		end
	end


end