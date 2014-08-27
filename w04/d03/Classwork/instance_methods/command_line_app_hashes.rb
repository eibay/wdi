require_relative './class_command_line_app_hashes'

comedians = []

loop do

puts "What is your name?"

name = gets.chomp

puts "What is your age?"

age = gets.chomp

puts "Tell me a joke"

joke = gets.chomp

kevin_hart = Comedian.new(name, age, joke)

russell_peters = Comedian.new(name, age, joke)

chris_rock = Comedian.new(name, age, joke)

comedians << kevin_hart
comedians << russell_peters
comedians << chris_rock

comedians.each do |comedian|
  comedian.getInfo
end

end # ends loop statement