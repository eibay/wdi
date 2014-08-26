require 'json'

class Car

	def self.get_data()
		return JSON.parse(File.read("./cars.txt"))
	end

	def self.add_car(car)
		data_cars = self.get_data()
		data_cars << car
		File.write("./cars.txt", data_cars.to_json)
	end

	def self.search_car(criteria)
		data_cars = self.get_data()
		searched_car = data_cars.find_all do |car|
			car["make"] == criteria.capitalize || car["model"] == criteria.capitalize
		end
	end

end

