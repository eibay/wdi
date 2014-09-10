require 'httparty'
require_relative './libs/connection'
require_relative './libs/Dog_class'


Dog.all.each do |a|
	puts a[:breed]
end 

puts "Which dog would you like to delete?"

dog_delete = gets.chomp
dog_instance = Dog.find_by(breed: dog_delete)
dog = dog_instance[:id]

HTTParty.delete("http://127.0.0.1:4567/dog/#{dog}",{:body => {:age => "15", :name => "Bernie", :breed => "bulldog"}})

