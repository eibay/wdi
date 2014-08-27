require "json"
require "securerandom"

class Car
	def self.add(car)
		car["id"] = SecureRandom.hex
		cars = self.full_array()
		cars << car
		File.write("./cars.txt", cars.to_json)
	end

	def self.search(key, value)
			self.full_array.select do |car|
			car[key] == value
		end
	end

	def self.full_array()
		return JSON.parse(File.read("./cars.txt"))
	end

end

