require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# patients = []

puts "What is your first name?"
first_name = gets.chomp

puts "What is your last name?"
last_name = gets.chomp

puts "What date were you admitted?"
admit_date = gets.chomp

puts "What is your illness/condition?"
condition = gets.chomp

patient = {"first"=>first_name, "last"=>last_name, "admit_date"=>admit_date, "ailment"=>condition}

# patients is an array
patients = JSON.parse(File.read('./patients.txt'))
# add hash to array
patients.push(patient)
# convert array to JSON
patients_json = JSON.generate(patients)
# takes 2 args, file to write and what to write
File.write('./patients.txt', patients_json)
