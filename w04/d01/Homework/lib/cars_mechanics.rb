require 'json'

class Mechanics

	def self.all()
		return JSON.parse(File.read('./mechanic.txt'))
	end

	def self.add(mechanic)
		mechanics=all()
		mechanics.push(mechanic)
		File.write('./mechanic.txt', mechanics.to_json)
		return mechanics
	end

	def self.search(key, value)
		mechanic_result = []
		self.all.each do |mechanic|
			if mechanic[key].include?(value)
				mechanic_result.push(mechanic)
			end
		end
		
		return mechanic_result
	end

end


class Cars

	def self.all()
		return JSON.parse(File.read('./car.txt'))
	end

	def self.add(car)
		cars=all()
		cars.push(car)
		File.write('./car.txt', cars.to_json)
		return cars
	end

	def self.search(key, value)
		car_result = []
		self.all.each do |car|
			if car[key].include?(value)
				car_result.push(car)
			end
		end
		
		return car_result
	end

end
