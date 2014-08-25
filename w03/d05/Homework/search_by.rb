
def search_patients_by key, val 
	f = File.read "./patients.db"
	patients = JSON.parse f 

	results = patients.select do |patient|
		# return partial matches as results #
		# such searching for Stew will still return Stewie & 
		# searching for Stewie will still return Stew # 
		val.include?(patient[key]) || patient[key].include?(val) 
	end 
	results 
end 