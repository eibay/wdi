# Part 1: Write a command line app that prints prime numbers

# Print the prime numbers between 1-100
# Do not just copy and paste these numbers, you should programmatically determine which numbers are prime
# Your program should run once and then exit
# Here is a snippet of sample output:

require 'prime'

Prime.each(100) do |prime|
  p prime 
end