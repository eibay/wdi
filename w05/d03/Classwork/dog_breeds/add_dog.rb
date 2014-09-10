puts "Hello. Welcome to the dog database. What is the breed of dog you want to update?"

breed = gets.chomp

puts "What is the dog's name?"

name = gets.chomp

puts "What is the dog's age?"
age= gets.chomp

dog_to_update = Dog.find_by(:breed breed)
id = dog_to_update[:id]


HTTParty.put("http://127.0.0.1:4567/dog/#{id}",{:body => {:age => "#{age}", :name => "#{name}", :breed => "#{breed}"}})



puts "Thank you! Your dog has been added to the database"