require "pry"
require "securerandom"
require "json"

list = JSON.parse(File.read("mechanics.txt"))

list.each {|entrant| entrant["unique_id"] = SecureRandom.hex}

json_list = JSON.generate(list)

File.write("mechanics.txt", json_list)

binding.pry