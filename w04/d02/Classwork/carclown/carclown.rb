require 'JSON'
require 'securerandom'

class Car
	def self.parse()
		return JSON.parse(File.read('./car.txt'))
	end

	def self.add(car)
		car["ID"] = SecureRandom.hex
		cars = self.parse()
		cars.push(car)
		File.write('./car.txt', cars.to_json)
	end
	def self.find_by(key, value)
    self.parse().find_all do |car|
      car[key].downcase == value.downcase
  		end
  	end
end

class Clown
	def self.parse()
		return JSON.parse(File.read('./clown.txt'))
	end

	def self.add(clown)
		clown["ID"] = SecureRandom.hex
		clowns = self.parse()
		clowns.push(clown)
		File.write('./clown.txt', clowns.to_json)
	end
	def self.select_by(key, value)
		self.parse().select do |clown|
			clown[key].downcase == value.downcase
		end
	end
end