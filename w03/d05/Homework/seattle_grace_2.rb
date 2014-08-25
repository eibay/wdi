require 'json'
require 'pry'

condition = JSON.parse(File.read("./patients.txt"))

puts "What is the disease that plagues you?"

ailment = gets.chomp

results = []

condition.select do |patient|
  #if patient["condition"] == condition
  if results.empty? == true
    puts "We do not have any peeps that match the #{ailment}"
  else
    puts results
  end
end
