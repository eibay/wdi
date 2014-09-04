require "httparty"
require "pry"
require_relative "./breed"

puts "Here are all the breeds in the Compendium."
Breed.all.each do |breed|
	puts breed.name
end

puts "What name would you like to change?"
puts "(Later on, you can tell me what governing authority gave you the power to do that- change the name of a breed.)"

unfinished = true

while unfinished

	entry = gets.chomp

	if  Breed.find_by( { name: entry } )
		puts "What should the name become?"
		change = gets.chomp
		breed = Breed.find_by( { name: entry } )
		HTTParty.put("http://127.0.0.1:4567/breeds/#{breed.id}", { :body => {"name" => change} } )
		unfinished = false
		puts "Updated!"
	else
		puts "You didn't enter that correctly.  Trust me."
	end

end

puts "Just kidding!  I don't care if you change the name of a breed!"