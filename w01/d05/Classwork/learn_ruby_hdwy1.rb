# puts 'I will now count his chickens:'

# puts "Hens #{25 + 30 / 6}"
# puts "Roosters #{100 - 25 * 3 % 4}"

# puts 'Now I will count the eggs:'

# puts 3 + 2 + 1 - 5 + 4 % 2 - 1/4 + 6

# puts 'Is it true that 3 + 2 < 5 - 7?'

# puts 3 + 2 < 5 - 7

# puts "What is 3 + 2? #{3 + 2}"
# puts "What is 5 - 7? #{5 - 7}"


# puts "Oh, that's why it's false."
# puts 'How about some more.'

# puts "Is it greater? #{5 > -2}"
# puts "Is it greater or equal? #{5 >= -2}"
# puts "Is it less or equal? #{5 <= -2}"


#  puts 'Won\'t you read O\'sReilly\'s book?'

# cars is the variable and 100 is the value
# 

# his_name = 'zed A. Shaw'
# his_age = 35 # not a lie in 2009
# his_height = 74 # Inches
# his_weight = 180 # lbs
# his_eyes = 'Blue'
# his_teeth = 'White'
# his_hair = 'Brown'

# puts "let\'s talk about #{his_name}."
# puts "He\'s #{his_height} inches tall."
# puts "He\'s #{his_weight} pounds heavy."
# puts "Actually that's not too heavy."
# puts "But this is Europe, so he weights #{his_weight_kilo = his_weight / 2.20} in kilogram"
# puts "and he is #{his_height_centi = his_height / 0.39} centimeters tall"
# puts "He\'s got #{his_eyes} eyes and #{his_hair} hair."
# puts "His teeth are usually #{his_teeth} depending on the coffee."
# puts "If I add #{his_age}, #{his_height_centi}, and #{his_weight_kilo} I get #{his_age + his_height_centi + his_weight_kilo}."


#variable equal to value
# types_of_people = 10


# #variable equals string with a variable inside 
# x = "There are #{types_of_people} types of people."
# #variable equal to value that's a string
# binary = "binary"
# #variable equal to value that's a string
# do_not = "don't"

# #variable equals string with a variable inside 
# y = "Those who know #{binary} and those who #{do_not}"

# #outputs/prints x and y
# puts x
# puts y

# #outputs/prints string with the value of the variable
# puts "I said: #{x}."
# puts "I also said: '#{y}'."


# hilarious = false
# joke_evaluation = "Isn't that joke so funny?! #{hilarious}"

# puts joke_evaluation

# w = "This is the left side of . . . "
# e = "a string with a right side."

# puts w + e


# Exercise 7

# puts "Mary had a little lamb."
# puts "Its fleece was whie as #{'snow'}."
# puts "And everywhere that Mary went."
# puts "." * 10 # what'd that do? It will output 10 dots

# end1 = "C"
# end2 = "h"
# end3 = "e"
# end4 = "e"
# end5 = "s"
# end6 = "e"
# end7 = "B"
# end8 = "u"
# end9 = "r"
# end10 = "g"
# end11 = "e"
# end12 = "r"

# # watch that print vs puts on this line what's it do?
# print end1 + end2 + end3 + end4 + end5 + end6
# puts end7 + end8 + end9 + end10 + end11 + end12


#ruby Ex 8

# formatter = "%{first} %{second} %{third} %{fourth}"


# puts formatter % {first: 1, second: 2, third: 3, fourth: 4}
# puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}
# puts formatter % {first: true, second: false, third: true, fourth: false}
# puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter}

# puts formatter % {
# 	first: "I had this thing.",
# 	second: "That you could type up right.",
# 	third: "But it didn't sing.",
# 	fourth: "So I said goodnight."
# }

# ruby ex9.

# days = "Mon Tue Wed Thu Fri Sat Sun"
# months = "Jan\nFeb\nMar\nApr\nJun\nJul\nAug"

# puts "Here are the days: #{days}"
# puts "Here are the months: #{months}"

# puts """
# There's something going on here.
# With the three double-quotes.
# We'll be able to type as much as we like.
# Even 4 lines if we want, or 5, or 6.
# """

# ruby Ex 10

# tabby_cat = "\tI'm tabbed in."
# persian_cat = "I'm split\non a line."
# backslash_cat = "I'm \\ a \\ cat."

# fat_cat = """
# I'll do a list:
# \t* Cat food
# \t* Fishies
# \t* Catnip\n\t* Grass
# """

# puts tabby_cat
# puts persian_cat
# puts backslash_cat
# puts fat_cat

#ruby Ex 11

# print "How old are you?"
# age = gets.chomp
# print "How tall are you?"
# height = gets.chomp
# print "How much do you weigh?"
# weight = gets.chomp

# puts "So, you're #{age} old, #{height} tall and #{weight} heavy."

# Ruby Ex 12

# print "Give me a number "
# number = gets.chomp.to_i

# bigger = number * 100
# puts "A bigger number is #{bigger}."

# print "Give me another number:"
# another = gets.chomp
# number = another.to_i

# smaller = number / 100
# puts "A smaller number is #{smaller}."

# Drills:

# 1. the .to_f operation turns the number to a float
# *****2, make a script that ask for money and gives back 10%.*****

# print "The Bank is promoting something great today."
# print "Deposit something today and get back 10% in 6 months."
# print "How much would you like to deposit? "
# deposit =  gets.chomp.to_f
# dep_interest = deposit * 10% + deposit

# print "You will recieve #{interest}"

#Ruby Ex 13*******

# Drill 2

# puts "Give me three names: "
# names = gets.chomp

# first, second, third = ARGV

# puts "Your first variable is: #{first}"
# puts "Your second variable is: #{second}"
# puts "YOur third variable is: #{third}"

#Ruby Ex 14

# user_name = ARGV.first
# prompt = ':: '

# puts "Hi #{user_name}"
# puts "I'd like to ask you a few questions."
# puts "Do you like me #{user_name}? ", prompt
# likes = $stdin.gets.chomp

# puts "Where do you live #{user_name}? ", prompt
# lives = $stdin.gets.chomp

# puts "What kind of computer do you have? ", prompt
# computer = $stdin.gets.chomp

# puts """
# Alright, so you said #{likes} about liking me.
# You live in #{lives}.  Not sure where that is.
# And you have #{computer} computer.  Nice.
# """
 
#Ruby Ex 18

# this one is like your scripts with ARGV
# def print_two(*args)
# 	arg1, arg2, = args
# 	puts "arg1: #{arg1}, arg2: #{arg2}"
# end

# # ok, that *args is actually pointless, we can just do this
# def print_two_again(arg1, arg2)
# 	puts "arg1: #{arg1}, arg2: #{arg2}"
# end

# # this just takes one argument
# def print_one(arg1)
# 	puts "arg1: #{arg1}"
# end

# # this one takes no arguments
# def print_none()
# 	puts "I got nothin'."
# end

# print_two("Zed", "Shaw")
# print_two_again("Zed", "Shaw")
# print_one("First!")
# print_none()


# ****** Do the Drills for 18*******

#Ruby Ex 19

def cheese_and_crackers(cheese_count, boxes_of_crackers)
	puts "You have #{cheese_count} cheeses!"
	puts "You have #{boxes_of_crackers} boxes of crackers!"
	puts "Man that's enough for a party!"
	puts "Get a blanket. \n"
end

puts "We can just give the function numbers directly:"
cheese_and_crackers(20, 30)

puts "OR, we can use variables from our script:"
amount_of_cheese = 10
amount_of_crackers = 50

puts "We can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6)

puts "And we can combine the two, variables and math:"
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers +1000)
	










