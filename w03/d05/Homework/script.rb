require 'yaml'
require 'csv'
require 'json'

all_chars = []

# if we already have the doctors db load it # 
if File.exists? "./doctors.db"
	f = File.read "./doctors.db"
	doctors = JSON.parse f
else 
	# else extract all the info from the greys.txt file # 
	i = CSV.read "./greys.txt" 
	i.each do |l|
		char = {}
		char[:actor] = l[0]
		char[:name] = l[1]
		char[:episodes] = l[2].to_i 
		if l[3].nil? 
			char[:run] = nil 
		elsif l[3].include? '-' 
			range = l[3].split '-'
			char[:run] = (range[0].to_i..range[1].to_i).to_a  
		else 
			char[:run] =  [l[3].to_i] 
		end  
		all_chars << char
	end
	# get the doctors &  
	doctors = all_chars.select do |char|
		if char[:name].nil?
			false
		else 
			char[:name].include? "Dr."
		end 
	end 
	# create the doctors db # 
	File.write "./doctors.db", doctors.to_json 
end 

f = File.read "./patients.db"
patients = JSON.parse f
	
# randomly assign all the patients a doctor #
patients = patients.each do |patient|
	patient["doctor"] = doctors.sample 
end 

# change the entries in the patients db # 
File.write "./patients.db", patients.to_json
