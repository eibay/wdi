require 'pry'
require 'securerandom'
require 'json'




class Cars

	def self.all
		JSON.parse(File.read("./cars.txt"))
	end

	def self.create(car)
		car["id"] = SecureRandom.hex
		autography = self.all
		autography << car
		File.write("./cars.txt", JSON.generate(autography))
	end

	def self.find_by(key, value)
		autography = self.all
		autography.find do |car|
			car[key] == value
		end
	end

	def self.select_by(key, value)
		autography = self.all
		autography.select do |car|
			car[key] == value
		end
	end

end


class Clowns


	def self.all
		JSON.parse(File.read("./clowns.txt"))
	end

	def self.create(clown)
		autography = Cars.all
		last = autography.length - 1
		clown["id"] = SecureRandom.hex
		clown["assigned_car"] = autography[rand(0..last)]["id"] unless clown["assigned_car"]
		clownography = Clowns.all
		clownography << clown
		File.write("./clowns.txt", JSON.generate(clownography))
	end

	def self.find_by(key, value)
		clownography = self.all
		clownography.find do |clown|
			clown[key] == value
		end
	end

	def self.select_by(key, value)
		clownography = self.all
		clownography.select do |clown|
			clown[key] == value
		end
	end
end

binding.pry


















