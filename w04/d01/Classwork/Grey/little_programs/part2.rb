require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'



puts "What illness/condition are you looking for?"
illness_seek = gets.chomp


patients = JSON.parse(File.read('./patients.txt'))



patients.each do |patient|
	if patient["ailment"].downcase  ==  illness_seek.downcase
		puts patient["first"] + " " + patient["last"] + " was admitted on " + patient["admit_date"]
	end
end

