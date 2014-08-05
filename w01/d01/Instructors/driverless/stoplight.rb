# puts("HELLO CLASS/WORLD!")
puts("What color is the light?!")
light = gets.chomp

# puts "red\n**\nWEEEE NEW LINES\n\n"

if light == "red"
  puts("STOP!")
elsif light == "yellow"
  puts("Slow Down")
elsif light == "green"
  puts("GOGOGO!")
else
  puts("That is not a light...")
end 