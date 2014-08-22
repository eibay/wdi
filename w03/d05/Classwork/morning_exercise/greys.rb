require 'pry'

char_file = File.readlines('./greys.txt')

characters = []
char_file.each do |x|
  char_hash = {}
  character = x.split(",")
  character[3] = character[3].delete("\n")
  char_hash["character"] = character[1]
  char_hash["actor"] = character[0]
  char_hash["episodes"] = character[2]
  char_hash["end_year"] = character[3]
  characters << char_hash
end


stars = []

characters.each do |x|
  if x["episodes"].to_i > 150
    stars << x
  end
end

minor = []

characters.each do |x|
  if x["episodes"].to_i < 10
    minor << x
  end
end
binding.pry
puts
puts "Stars"
puts "-------"
puts
puts stars
puts
puts "Number of Minor Peeps"
puts "----------------------"
puts minor.length
# puts characters
