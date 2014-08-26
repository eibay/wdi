require 'json'

class Mechanic 

	def self.all 
		f = File.read "./mechanics.db"
		JSON.parse f
	end 

	def self.create mechanic  
		mechanics = self.all  
		mechanics << mechanic  
		File.write "./mechanics.db", mechanics.to_json 
	end 

	def self.find_all_by k, v 
		self.all.select do |mechanic| 
			mechanic[k].downcase == v.downcase  
		end 
	end
end 