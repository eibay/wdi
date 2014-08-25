require 'json'

class Mechanic
	def self.all()
		return JSON.parse(File.read("./mechanics.txt"))
	end

	def self.create(mechanic)
		mechanics = self.all()
		mechanics << mechanic 
		File.write("./mechanics.txt", mechanics.to_json)
	end
		
	def self.find_by(key, value)
		self.all().find { |mechanic| mechanic[key] == value }
	end
end