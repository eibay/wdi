
require 'json'
require_relative './lib/exercise2_class.rb'




puts "add student?"
ans = gets.chomp

while ans == "y" || ans == "yes" do
  array = JSON.parse(File.read("./exercise2students.txt"))

  puts "first?";  first = gets.chomp
  puts "last?";   last = gets.chomp
  puts "email?";  email = gets.chomp


  student = Student.new(first, last, email)
  array << student.list

  puts array
  puts " "

  File.write("./exercise2students.txt", array.to_json)

  puts "continue adding students?"
  ans = gets.chomp
end
