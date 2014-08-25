require 'pry'
require 'json'
require './doc.rb'


puts "Please enter a first name"
fName = gets.chomp.downcase
puts "Please enter a last name"
lName = gets.chomp.downcase
puts "Please enter an admission date(Y/M/D)"
date = gets.chomp
puts "Please enter a condition"
condition = gets.chomp.downcase
doc = doc_search
patients = JSON.parse(File.read('./patients.txt'))
patients<<{fName: fName, lName: lName, date: date, condition: condition, doc: doc}
print "This information:" + patients.last + "was admitted to the hospital."
File.write('./patients.txt', patients.to_json)