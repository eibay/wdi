require 'httparty'
require 'pry'
require_relative './lib/connection'
require_relative './lib/breed'

breeds = Breed.all()

breeds.each do |b|
	puts b[:breed]
end

puts "Which breed would you like to update?"
old_breed = gets.chomp
puts "What would you like to call it instead?"
new_breed = gets.chomp

change_breed = Breed.find_by( { breed: old_breed } )
## change_breed = { breed: scottie, id: 2}

HTTParty.put("http://127.0.0.1:4567/breeds/edit/#{change_breed[:id]}", {:body => {:id =>change_breed.id, :breed => new_breed } })

#binding.pry



# put("/breeds/edit/:id") do
#   breed = Breed.find_by({id: params[:id]})

#   breed_name = params["breed"]
#   breed.update({breed: breed_name})
  
#   redirect "/"

# end

