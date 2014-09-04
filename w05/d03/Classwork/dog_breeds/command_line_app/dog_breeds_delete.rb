require 'httparty'
require_relative '../lib/connection'
require_relative '../lib/breed'
require 'pry'
# require 'sinatra'
require 'active_record'

# binding.pry
Breed.all.each do |dog|
  puts "#{dog[:breed]}: #{dog[:id]}"
end

puts "What is the id of the dog do you want to delete?"
id = gets.chomp.to_i

HTTParty.delete("http://127.0.0.1:4567/breed/#{id}", {:body => {:id => id}})
# HTTParty.delete("http://127.0.0.1:4567/breed/#{:id}", {:body => {:id => id}}) # this doesnt work because :id should be #{id}

puts "DELETED!"

Breed.all.each do |dog|
  puts "#{dog[:breed]}: #{dog[:id]}"
end


