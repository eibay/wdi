n = 0

def say(str)
  puts str
end

while n <= 100

  if n % 3 == 0 && n % 5 == 0
    puts "FizzBuzz"
  elsif n % 3 == 0
    puts "Fizz"
  elsif n % 5 == 0
    puts "Buzz"
  else
    puts n
  end

  n = n + 1
end