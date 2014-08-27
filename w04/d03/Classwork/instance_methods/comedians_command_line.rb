  require_relative './class_command_line'

  comedians = []

  loop do

    puts "What is your first name?"

        first_name = gets.chomp

        puts "What is your age?"

        last_name = gets.chomp

        puts "What is your last name?"

        age = gets.chomp

        puts "What is your joke?"

        joke = gets.chomp

        comedian_new = Comedian.new(first_name, last_name, age, joke)

        comedians << comedian_new

       comedians.each do |x|
        puts x.info
      end

  end

  #######################

