require 'securerandom'
require 'json'
require 'pry'

class Ship
	def self.all()
		return JSON.parse(File.read('./ships.txt'))
	end

	def self.create(ship)
		ships = self.all()
		ships.push(ship)
		ships_json = JSON.generate(ships)
		File.write('./ships.txt', ships_json)
	end

	def self.find_by(key, value)
		self.all().find do |ship|
			ship[key] == value
		end
	end

	def self.select_by(key, value)
		self.all().select do |ship|
			ship[key].downcase == value.downcase
		end
	end
end
