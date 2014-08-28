require_relative './comedian'

counter = 0
comArr = []
while counter <= 3
puts "name?"
name = gets.chomp
puts "age?"
age = gets.chomp
puts "joke?"
joke = gets.chomp

hash = {"name" => name, "age" => age, "joke" => joke}
newComedian = Comedian.new(hash)
newhash = newComedian.getInfo
puts "#{newhash["name"]} is #{newhash["age"]} years old, and often says #{newhash["joke"]}."
comArr<<newhash
counter += 1
end
puts comArr