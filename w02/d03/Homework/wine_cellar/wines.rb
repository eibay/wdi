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
 {:label => "Angeline", :type => "Pinot Noir", :color => "red"} ]

 #wine_cellar << {:label => "Stag's Leap", :type => "Cabernet Sauvignon", :color => "red"}

 #wine_cellar.sample

#whites = wine_cellar.select { |wine| wine[:color] == "white"}

#two_word_labels = wine_cellar.select { |wine| wine[:label].split.size == 2}