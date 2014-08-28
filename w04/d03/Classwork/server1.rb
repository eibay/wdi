require 'pry'
require 'json'
require 'securerandom'
require_relative './instance_methods/comedian'

comedian = "yes"



while comedian == "yes"
  puts "what is your name"
  name = gets.chomp
  puts "Age"
  age = gets.chomp
  puts "fav joke"
  joke = gets.chomp

  name = Comedian.new(name, age, joke)
  list = JSON.parse(File.read('./students.txt'))
  list << {"name" => name.name, "age" => name.age, "fav" => name.tell_joke, "id" => SecureRandom.hex}
  list.each do |clown|
    puts "Your name is #{clown["name"]}, age is #{clown["age"]} and your joke is #{clown["fav"]}"
  end
  File.write('./students.txt', list.to_json)
  puts "want to continue"
  comedian = gets.chomp.downcase
end
