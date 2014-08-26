require 'pry'
require 'JSON'
require 'securerandom'
require_relative './views/cars'
require_relative './views/clowns'


puts "Clown Name"
clown_name = gets.chomp

puts "Shoe Size"
shoe_size = gets.chomp

clown_id = SecureRandom.hex


clown = {"name" => clown_name, "shoe_size" => shoe_size, "clown_id" => clown_id}


clowns = JSON.parse(File.read('./clowns.txt'))
clowns.push(clown)
clowns_json = JSON.generate(clowns)
clowns.push(clown)
File.write('./clowns.txt', clowns_json)
