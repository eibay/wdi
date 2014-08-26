require 'pry'
require 'securerandom'
require 'json'

file = JSON.parse(File.read("./car.txt"))

file.each do |car|
  car["id"] = SecureRandom.hex
end

File.write("./car.txt", file.to_json)
#write outside loop
