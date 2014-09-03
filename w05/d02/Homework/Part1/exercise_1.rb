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
    prime << x if x/y != Integer; x != y
  end
end