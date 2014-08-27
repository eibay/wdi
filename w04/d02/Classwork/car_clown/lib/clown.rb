require 'json'

class Clown
	def self.all()
		return JSON.parse(File.read('../clowns.txt'))
	end

	def self.create
		clowns = Clown.all()
		clowns_json = JSON.generate(clowns)
		Filr.write('../clowns.txt', clowns_json)
	end
end