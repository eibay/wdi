require 'pry'
require 'json'
require_relative "./lib/pokeman.rb"


puts "add pokemon?"
ans = gets.chomp

while ans == "y" do
  array = JSON.parse(File.read("./pokemans.txt"))

  puts "name?";     name = gets.chomp
  puts "element?";  element = gets.chomp
  puts "level?";    level = gets.chomp

  attr_pkmn = {name: name, element: element, level: level}
  pokemon = Pokemon.new(attr_pkmn)

  puts pokemon.list
  puts pokemon.return_hash

  array << pokemon.return_hash

  File.write("./pokemans.txt", array.to_json)


  puts "add more pokemon?"
  ans = gets.chomp

end