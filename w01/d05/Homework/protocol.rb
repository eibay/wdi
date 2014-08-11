  #Server response should be the automated one!

  require 'socket'

    server = TCPServer.new 2000

      while true

         client = server.accept

#1)

     client.puts "Hello"

     greeting = client.gets.chomp

   client.puts "HELLO!"


#2)

     client.puts "Sup"

       user_echo = client.gets.chomp

         client.puts "You said Sup"

         user_echo_2 = client.gets.chomp

     client.puts "I did, how about What's up?"

     user_echo_3 = client.gets.chomp

  client.puts "You just said What's up :)"


#3)

 client.puts "Ping"

  user_tt = client.gets.chomp

    client.puts "Pong"

#4)

   client.puts "Guess a number between 1 - 10?"

    guess = client.gets.chomp

    correct_guess = ["5", "6", "7"]

     if correct_guess.include?(guess)

    client.puts "Correct!"

   else

  client.puts "Wrong!"

end

#5)

#Exercise options

 client.puts "Let's play the fitness game! It has three exercises and you can only do any of the three core exercises. Choose wisely, as a hint I'll tell you they all start with p!"

    exercise_choice = client.gets.chomp

    exercise = ["pullups", "pushups", "plank"]

     if exercise.include?(exercise_choice)

      client.puts "Drop and give me ten motherfuckaaaa"

      else

      client.puts "You're too weak to move on to other exercises just yet bud"

      end

    client.close # closes out nc connection

  break #breaks the loop

end #while loop end statement


