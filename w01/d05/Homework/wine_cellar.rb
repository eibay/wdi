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

Write code that:

Adds a wine of your choice to the cellar

wine_cellar.push [
  :label => "Alamos",  
  :type => "Malbec",  
  :color => "red"

]

Returns a random wine from the cellar
wine_cellar.shuffle 
wine_cellar[0]

Returns an array of just the white wines
puts :label

Returns an array listing the unique types of wine
Returns an array with the all the wines that have 2-word labels
Returns an array with the labels of the wines that a type of Pinot Noir