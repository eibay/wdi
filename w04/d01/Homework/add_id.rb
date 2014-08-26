require 'json'
require 'securerandom'

mechanics = JSON.parse(File.read('./mechanics.txt'))

mechanics.each do |mechanic|
	mechanic["id"] = SecureRandom.hex
end

# File.write("./mechanics.txt", mechanics.to_json)

puts mechanics