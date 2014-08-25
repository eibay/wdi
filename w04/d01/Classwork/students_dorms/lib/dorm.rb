require 'json'

class Dorm
	def self.all()
		return JSON.parse(File.read('./dorms.txt'))
	end

	def self.create(name, capacity)
		dorms_list = self.all()
		dorm = {}
		dorm[:name] = name
		dorm[:capacity] = capacity
		dorms_list << dorm

		File.write('./dorms.txt', dorms_list.to_json)
		return dorm
	end
end

