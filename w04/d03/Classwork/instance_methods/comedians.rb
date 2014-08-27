require 'pry'
require_relative './comedian'

comedians = []

comedian1 = Comedian.new("Jerry Seinfeld", 52, "Not that there's anything wrong with that.")
comedian2 = Comedian.new("Rodney Dangerfield", 85, "No respect.")
comedian3 = Comedian.new("Ellen DeGeneres", 50, "Why did the monkey fall out of the tree? Because it was dead.")

#comedians = [comedian1, comedian2, comedian3]

comedians << comedian1
comedians << comedian2
comedians << comedian3

comedians.each do |shecky|
	shecky.tell_joke
end