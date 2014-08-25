require 'json'
require 'pry'


puts "Please fill in the following data:"

puts "First name"
first_name = gets.chomp

puts "Last name:"
last_name = gets.chomp

puts "Date of admission:"
puts "day?"
day = gets.chomp
puts "month?"
month = gets.chomp
puts "year?"
year = gets.chomp
date_admission = "#{day}-#{month}-#{year}"

puts "What is your condition?"
condition = gets.chomp

hash = {first_name: first_name, last_name: last_name, date_admission: date_admission, condition: condition}

data = File.read("./data.txt")
data_parsed = JSON.parse(data)
data_parsed << hash
data_to_save = data_parsed.to_json

File.write('./data.txt', data_to_save)


