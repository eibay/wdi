require 'json'

class Car 

	def self.all 
		f = File.read "./cars.db"
		JSON.parse f 
	end 

	def self.create car 
		cars = self.all  
		cars << car 
		File.write "./cars.db", cars.to_json 
	end 

	def self.find_all_by k, v 
		self.all.select do |car| 
			car[k].downcase == v.downcase  
		end 
	end 
end 

def assign_car_worker model   
	canidates = Mechanic.find_all_by "model", model 
	worker = canidates.sample 
	worker["name"] 
end 