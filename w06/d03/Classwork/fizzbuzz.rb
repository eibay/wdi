1.upto(100) do |num|
  if num % 15 == 0
    puts "fizzbuzz"
  elsif num % 3 == 0
    puts "fizz"
  elsif num % 5 == 0
    puts "buzz"
  else puts num
  end
end

1.upto(100) do |num|
  printed = false
  if num % 3 == 0
    print "fizz"
    printed = true
  end
  if num % 5 == 0
    print "buzz"
    printed = true
  end
  print "\n" if printed
  print "#{num}\n" unless printed
end
