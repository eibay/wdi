require 'json'

class Dorm
	def self.all()
		return JSON.parse(File.read("./dorms.txt"))
	end

	def self.create(dorm)
		dorms = self.all()
		dorms << dorm
		File.write("./dorms.txt", dorms.to_json)
	end

	def self.find_by(key, value)
		self.all().find {|dorm| dorm[key] == value}
	end
end