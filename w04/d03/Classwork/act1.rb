require_relative './comedian'
require 'pry'


nas = Comedian.new("Nastassia", 26, "What do you call cheese that's not yours?\nNACHOOOO CHEESE!")

raj = Comedian.new("Raj", 40, "What do you call it when batman skips church?\nChristian Bale!")

mike = Comedian.new("Mike", 41, "How did the hipster burn his tongue?\nHe drank his coffee before it was cool!")

comedians = [nas, raj, mike]


comedians.each do |comedian|
  puts "Comedian: #{"@name"} #{comedian.instance_variable_get("@fav_joke")}"
end
