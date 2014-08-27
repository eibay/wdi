require_relative './lib/mechanic.rb'
require 'json'

require 'securerandom'

mechanics = Mechanic.get_data


mechanics.each do |mechanic|
	mechanic["id"] = SecureRandom.hex
end

puts mechanics



File.write("./mechanics.txt", mechanics.to_json)