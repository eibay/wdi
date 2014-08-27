require 'json'
require 'securerandom'

mechanics=JSON.parse(File.read("./mechanics.txt"))

mechanics.each do |n|
	n["mechanic"]=SecureRandom.hex
	puts "added id to mechanics"
	File.write("./mechanics.txt", mechanics.to_json)
end

