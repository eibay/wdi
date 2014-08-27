  require_relative '../instance_methods_instructor/comedian_instructor'

  comedians = []

  loop do

      puts "What is your first name?"

        first_name = gets.chomp

        # puts "What is your last name?"

        # last_name = gets.chomp

        puts "What is your age?"

        age = gets.chomp

        puts "What is your joke?"

        joke = gets.chomp

        comedians.each do |comedian|

        comedians << {first_name: first_name, joke: joke, age: age} #last_name: last_name,

        comedians.tell_joke

        end

      comedians_list = Comedian.new("Johnny Bananas", 25, "yo mama so fat that she dont need the internet she's already world wide")

      puts comedians_list.comedians

  end
