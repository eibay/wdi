require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'



puts "What illness/condition are you looking for?"
illness_seek = gets.chomp


patients = JSON.parse(File.read('./patients.txt'))

num_w_illness = 0
num_wo_illness = 0

patients.each do |patient|
	if patient["ailment"].downcase  ==  illness_seek.downcase
		puts patient["first"] + " " + patient["last"] + " was admitted on " + patient["admit_date"]
		num_w_illness += 1
	else
		num_wo_illness += 1
	end
end


if num_wo_illness == patients.count
	puts "Nobody in this hospital has #{illness_seek}"
end

