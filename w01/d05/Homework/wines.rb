require 'pry'

wine_cellar = [
  {:label => "Rutherford Hill", :type => "Chardonnay", :color => "white"},
  {:label => "Nina Veneto", :type => "Pinot Grigio", :color => "white"},
  {:label => "Wairau River", :type => "Sauvignon Blanc", :color => "white"},
  {:label => "Tangley Oaks", :type => "Merlot", :color => "red"},
  {:label => "Chimney Rock", :type => "Cabernet Sauvignon", :color => "red"},
  {:label => "Sanford", :type => "Pinot Noir", :color => "red"},
  {:label => "Alderbrook", :type => "Pinot Noir", :color => "red"},
  {:label => "Colavita", :type => "Pinot Noir", :color => "red"},
  {:label => "Markham", :type => "Chardonnay", :color => "white"},
  {:label => "Angeline", :type => "Pinot Noir", :color => "red"}
]

wine_cellar.push({
  label: "Bogle",
  type: "Cabernet Sauvignon",
  color: "red"
  })

two = wine_cellar[rand(0..wine_cellar.length - 1)]

# wine_cellar.each{|x| puts x if x[:color] == "white"} 

index = 0
array = Array.new
while index < wine_cellar.length
  if wine_cellar[index][:color] == "white"
    array.push(wine_cellar[index])
  end
  index += 1
end

puts array
puts
index = 0
array = []
while index < wine_cellar.length
  if wine_cellar[index][:label].split(" ").length == 2
    array.push(wine_cellar[index])
  end
  index += 1
end

puts array
puts
index = 0
array = []

while index < wine_cellar.length
  if wine_cellar[index][:type] == "Pinot Noir"
    array.push(wine_cellar[index][:label])
  end
  index += 1
end

puts array



















# binding.pry