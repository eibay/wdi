require "json"

class Car
	def self.add(x)
		cars = self.full_array()
		cars << (x)
		File.write('./cars.txt', cars.to_json)
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
		return JSON.parse(File.read('./cars.txt'))
	end
end