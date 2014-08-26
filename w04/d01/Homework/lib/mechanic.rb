require 'json'

class Mechanic

	def self.get_data()
		return JSON.parse(File.read("./mechanics.txt"))
	end

	def self.add_mechanic(mechanic)
		data_mechanics = self.get_data()
		data_mechanics << mechanic
		File.write("./mechanics.txt", data_mechanics.to_json)
	end

	def self.search_mechanic(criteria)
		data_mechanics = self.get_data()
		searched_mechanic = data_mechanics.find_all do |mechanic|
			mechanic["name"] == criteria.capitalize || mechanic["fav_car"] == criteria.capitalize
		end
	end

end

