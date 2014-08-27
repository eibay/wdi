require 'securerandom'
require 'json'
require 'pry'
list = JSON.parse(File.read('./mech.txt'))
puts list
binding.pry
list.each do |x|
	if x.keys.count == 3
		x["id"] = SecureRandom.hex
		
	end
end
puts list
