fizzbuzz = 1..100

  fizzbuzz.each do |number|
      if number % 5 == 0 && number % 3 == 0
          puts "Fizzbuzz"
      elsif number % 3 == 0
          puts "Fizz"
      elsif number % 5 == 0
          puts "Buzz"
        else
            puts number
        end
      end

