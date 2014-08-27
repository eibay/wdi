require 'pry'
require 'json'
require_relative './comedian'
counter = 0
while counter == 0

puts "name?"
name = gets.chomp
puts "age?"
age = gets.chomp
puts "joke?"
joke = gets.chomp

newcomedian = Comedian.new(name, age, joke)
newcomedian.show
binding.pry
all = JSON.parse(File.read('./stud.txt'))
all<<newcomedian
File.write('./stud.txt', all.to_json)
puts all 
puts "continue?"
answer = gets.chomp
	if answer == "no"
		counter += 1
	end
end