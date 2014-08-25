require 'json'
require 'pry'

puts "Condition to Search?"
search = gets.chomp.capitalize

patients = JSON.parse(File.read("./patient.txt"))


patients.each do |x|
  if x["condition"].include? search
  puts x["first"] + " " + x["last"] + " was admitted on " + x["date"] + " and has " + x["condition"]
  end
end