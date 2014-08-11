wine_cellar = [
  {:label => "Rutherford Hill", :type => "Chardonnay", :color => "white"},
  {:label => "Nina Veneto", :type => "Pinot Grigio", :color => "white"}, #
  {:label => "Wairau River", :type => "Sauvignon Blanc", :color => "white"}, #
  {:label => "Tangley Oaks", :type => "Merlot", :color => "red"}, #
  {:label => "Chimney Rock", :type => "Cabernet Sauvignon", :color => "red"}, #
  {:label => "Sanford", :type => "Pinot Noir", :color => "red"},
  {:label => "Alderbrook", :type => "Pinot Noir", :color => "red"},
  {:label => "Colavita", :type => "Pinot Noir", :color => "red"},
  {:label => "Markham", :type => "Chardonnay", :color => "white"},
  {:label => "Angeline", :type => "Pinot Noir", :color => "red"}
]


1)

  wine_cellar.push(:label => "Beer", :type => "Beer", :color => "Beer")

2)

 wine_cellar[rand(wine_cellar.length)]

3)

  wine_cellar.select do |white|
    if white[:color]["white"]
    puts white
   end
 end

4)

puts wine_cellar.values_at(1, 2, 3, 4)
