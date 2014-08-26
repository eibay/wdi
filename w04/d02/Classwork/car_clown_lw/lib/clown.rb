require 'pry'
require 'json'

class Clown
	def self.all()
		return JSON.parse(File.read('./clowns.txt'))
	end

	def self.create(clown)

		clowns = self.all()
 	   clown["id"] = SecureRandom.hex
		clowns.push(clown)
		clowns_json = JSON.generate(clowns)
		File.write('./clowns.txt', clowns_json)
	end

	










end