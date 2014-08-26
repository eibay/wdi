require 'json'
require 'securerandom'

class Clowns

	def self.create (clown)
		clowns = self.all()
		clowns.push(clown)
		clowns_json = JSON.generate(clows)
		File.write('./clowns.txt')
	end

	def self.select_by(key,value)
		self.all().select do |clown|
			clown[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./clowns.txt'))
	end
end

