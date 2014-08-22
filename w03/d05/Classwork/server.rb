
require 'pry'
splitting = File.read("./morning_exercise/greys.txt")
splitting = splitting.gsub("\n", ",") 
names = splitting.split(",")


array =[]

while names[0]
  empty = {}
  empty[:actor] = names[0]
  names.delete_at(0)
  empty[:character] = names[0]
  names.delete_at(0)
  empty[:episodes] = names[0]
  names.delete_at(0)
  if names[0].length > 4
    year = names[0].split("-")
    names.delete_at(0)
    empty[:start_year] = year[0]
  empty[:end_year] = year[1]
  end
  if names[0].length < 5
    empty[:start_year] = names[0]
    names.delete_at(0)
  end
array << empty
end

actors = []
array.each do|x|
  episodes = x[:episodes].split(" ")
  if episodes[0].to_i > 150
    actors << x[:actor]
   end
end


minor = []
array.each do|x|
  episodes = x[:episodes].split(" ")
  if episodes[0].to_i < 10
    minor << x[:actor]
   end
end
  
doctor =[]

array.each do|x|
  if x[:character].include?"Dr."
  doctor << x[:character]
  end
end
 
 started = []

 array.each do|x|
    yearstarted = x[:start_year].to_i
    yearended = x[:end_year].to_i
 if yearstarted <= 2007 && yearended >= 2007
  started << x[:character]
elsif yearstarted <= 2007 && yearended == nil
  started << x[:character]
elsif yearended == 2007
  started << x[:character]
elsif yearstarted == 2007
  started << x[:character]
  end
end
binding.pry






