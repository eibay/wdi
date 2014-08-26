
require "json"
require "securerandom"

class Clown
	def self.add(clown)
			clowns = self.full_array()
			clowns << clown
			File.write("./clowns.txt", clowns.to_json)
		end

	def self.search(key, value)
			self.full_array.select do |clown|
			clown[key] == value
		end
	end

	def self.full_array()
		return JSON.parse(File.read("./clowns.txt"))
	end

end