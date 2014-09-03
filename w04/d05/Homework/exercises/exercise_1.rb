require 'pry'


list = []

while true
  puts "please enter a command"
  response = gets.chomp
  command = response.split(" ")[0]
  number = response.split(" ")[1].to_i

  # binding.pry

  if command == "add" && number.class == Fixnum
    list << number
    puts "#{number} added!"

  elsif command == "list"
    print list.join(", ")
    puts " "
  else
    puts "please enter a valid command"
  end

end