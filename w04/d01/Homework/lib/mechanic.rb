require 'json'

class Mechanic
	def self.create(mechanic)
		mechanics = self.all()
		mechanics.push(mechanic)
		mechanic_json = JSON.generate(mechanics)
    	File.write('./mechanic.txt', mechanic_json)
	end

	def self.find_by(key, value)
		self.all().find do |x|
			x[key] == value
		end
	end

	def self.all ()
    	return JSON.parse(File.read('./mechanic.txt'))
		end
	end