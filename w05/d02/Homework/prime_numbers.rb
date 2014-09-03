# Part 1

puts "Welcome to the wonderful world of prime numbers!!"
prime_numbers = 1..100

primers = prime_numbers.reject {|p| p % 2 == 0 }
puts "Prime numbers from one to hundred are #{primers}"

# Part 2


