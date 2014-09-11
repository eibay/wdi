(1..100).each do |n|
  if n % 3 == 0 && n % 5 == 0
    n = "FizzBuzz"
  elsif n % 3 == 0
    n = "Fizz"
  elsif n % 5 == 0
  n = "Buzz"
  end
puts n
end

#diff way to do it and can also do 
for n in 1..100 #two dots include 100, three doesnt
  if n % 3 == 0 && n % 5 == 0
    n = "FizzBuzz"
  elsif n % 3 == 0
    n = "Fizz"
  elsif n % 5 == 0
  n = "Buzz"
  end
print n #on same line
end
   