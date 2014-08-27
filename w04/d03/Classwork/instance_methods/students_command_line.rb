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

        # comedians << {first_name: first_name, joke: joke, age: age} #last_name: last_name,

        comedian_new = Comedian.new(first_name, age, joke)

       comedians << comedian_new

        puts comedians

      end


