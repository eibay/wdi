require "httparty"
require "pry"
require_relative "./breed"

puts "Here are all the breeds in the Compendium."
Breed.all.each do |breed|
	puts breed.name
end



puts "Which breed do you want to delete from the Compendium?"
puts "You must have wanted to delete a breed- you typed 'delete_breed.rb', didn't you?"
puts "Or, was that someone else?"
puts "Just enter the name of the breed you're going to throw away like garbage."

unfinished = true

while unfinished

	entry = gets.chomp

	if  Breed.find_by( { name: entry } )
		breed = Breed.find_by( { name: entry } )
		HTTParty.delete("http://127.0.0.1:4567/breeds/#{breed.id}", { :body => {} } )
		puts "#{entry} was deleted.  Actually, the command the computer requires for this is 'destroy'.  So #{entry} was destroyed."
		unfinished = false
	else
		puts "You didn't correctly type the name of the breed you dislike unjustifiably.  Try again."
	end

end

