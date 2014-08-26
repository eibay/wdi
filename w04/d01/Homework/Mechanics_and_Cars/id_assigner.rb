require "securerandom"
require "json"

mechanics_array = JSON.parse(File.read("./mechanics.txt"))

mechanics_array.each do |mechanic|
	mechanic["id"] = SecureRandom.hex
end

File.write("./mechanics.txt", mechanics_array.to_json)
