require 'json'

class Mechanic
	def self.create(mechanic)
		mechanics = self.all()
		mechanics.push(mechanic)
		mechanics_json = JSON.generate(mechanics)
		File.write('./mechanics.txt', mechanics_json)
	end

	def self.find_by(key, value)
		self.all().find do |mechanic|
			mechanic[key] == value
		end
	end

	def self.all()
		return JSON.parse(File.read('./mechanics.txt'))
	end
end
