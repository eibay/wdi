require 'pry'

char_file = File.readlines('./greys.txt')

characters = []
char_file.each do |x|
  char_hash = {}
  character = x.split(",")
  years = character[3]
  character[3] = character[3].delete("\n")
  char_hash["character"] = character[1]
  char_hash["actor"] = character[0]
  char_hash["episodes"] = character[2].to_i
  if years.include?("-")
    char_hash["start_year"] = years.split("-")[0].to_i
    char_hash["end_year"] = years.split("-")[1].to_i
  else
    char_hash["start_year"] = years.to_i
    char_hash["end_year"] = years.to_i
  end
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

doctors = []

characters.each do |x|
  if x["character"].include?("Dr.")
    doctors << x
  end
end

the_year = []

characters.each do |x|
  if x["start_year"] <= 2007 && x["end_year"] >= 2007
    the_year << x["character"]
  end
end


puts
puts "Stars"
puts "-------"
puts
puts stars
puts
puts "Number of Minor Peeps"
puts "----------------------"
puts minor.length
puts
puts "The Doctors"
puts "------------"
puts doctors
