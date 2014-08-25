require 'json'
require 'pry'

html = JSON.parse(File.read('../patients.txt'))

puts "What codition does the person you are looking for have?"
condition = gets.chomp

html.each do |patient|
	if patient["condition"].include?(condition)
		puts patient
	end
end

