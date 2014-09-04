Part 1: Write a command line app that prints prime numbers

Print the prime numbers between 1-100
Do not just copy and paste these numbers, you should programmatically determine which numbers are prime
Your program should run once and then exit
Here is a snippet of sample output:
2
3
5
7
9
11
13
...

require 'prime'


Prime.take(25)
prime = []
[*1..100].each do |x|
  Prime.take(25).each do |y|
    prime << x if x == y
  end
end

# I know i can just do Prime.take(25)...


prime = []
[*1..100].each do |x|
  [*1..100].each do |y|
    prime << x if x/y != Integer && x != y && x != 1
  end
  puts prime
end



# odd = []
# [*1..100].each do |x|
#   odd << x if x % 2 != 0
# end

# prime = []
# nonprime =[]
# odd.each do |y|
#   odd.each do |z|

#     prime << y if y % z != 0
#   end
# end

# prime = []
# odd_and_2 = [2]
# [*2..100].each do |x|
#   odd_and_2 << x if x % 2 != 0

# end


# odd_and_2.each do |y|
#   divide_list = [*2..y-1]
#   array_litmus = []
#   divide_list.each do |x|

#     array_litmus << y if y % x == 0
#   end
#   prime << y if array_litmus.length == 0

#   puts prime
# end

prime = []
[*2..100].each do |y|
  divide_list = [*2..y-1]
  array_litmus = []
  divide_list.each do |x|

    array_litmus << y if y % x == 0
  end
  prime << y if array_litmus.length == 0

  puts prime
end


# FINALLY





