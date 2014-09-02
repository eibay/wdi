require 'json'

class Clown
	def self.create(clown)
		clowns = self.all()
		clowns.push(clown)
		clowns_json = JSON.generate(clowns)
		File.write('./clowns.txt', clowns_json)
	end

	def self.find_by(key, value)
		self.all().find do |clown|
			clown[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./clowns.txt'))