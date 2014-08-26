require "json"

class Mechanic
	def self.add(x)
		mechanics = self.full_array()
		mechanics << (x)
		File.write('./mechanics.txt', mechanics.to_json)
	end

	def self.search(key, value)
		self.full_array().find_all do |x|
			x[key].downcase == value.downcase
		end
	end

	def self.individual_result(key, value)
		self.full_array().find do |x|
			x[key].downcase == value.downcase
		end
	end

	def self.full_array()
		return JSON.parse(File.read('./mechanics.txt'))
	end
end