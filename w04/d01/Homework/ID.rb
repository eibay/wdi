require 'json'
require 'securerandom'
require 'pry'

input_file = ARGV[0]

mechanics = JSON.parse(File.read(input_file))

mech = mechanics.each do |m|
  if !(m.include?(m["id"]))
    m["id"] = SecureRandom.hex
  end
end

File.write(input_file, mech.to_json)
