require 'json'

class Dormitory 
	def self.create dorm 
		dormitories = self.all 
		dormitories << dorm 
		dormitories_json = dormitories.to_json  
		File.write "./dormitories.db", dormitories_json 
	end 

	def self.all 
		f = File.read "./dormitories.db" 
		JSON.parse f 
	end 

	def self.find_by k, v   
		self.all().find do |dorm|
			dorm[k] == v  
		end
	end 
end 