### Wine Cellar

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

def add_wine(wine, cellar)
  cellar.push(wine)
  puts "\n#{cellar[-1][:label]} was added to your cellar"
end

num_num = {:label => "Comfortably Numb", :type => "Shiraz", :color => "red"}
add_wine(num_num, wine_cellar)
puts wine_cellar

def get_random(cellar)
  random_wine = cellar.sample
  puts "\n#{random_wine[:label]}, a #{random_wine[:color]} #{random_wine[:type]}, was retrieved from the cellar"
end

get_random(wine_cellar)

def get_white(cellar)
  whites = []
  cellar.each {|wine| if wine[:color] == "white"; whites.push(wine) end}
  puts "\nWhites in your cellar are: #{whites}"
end

get_white(wine_cellar)

def get_types(cellar)
  types = []
  cellar.each {|wine| if !types.include?(wine[:type]); types.push(wine[:type]) end}
  puts "\nTypes of wines in your cellar are: #{types}"
end

get_types(wine_cellar)

def get_wordy(cellar)
  wordy_labels = []
  cellar.each {|wine| if wine[:label].include?(" "); wordy_labels.push(wine) end}
  puts "\nLabels with 2 words are: #{wordy_labels}"
end

get_wordy(wine_cellar)

def get_pinot_noir(cellar)
  pinot_noirs = []
  cellar.each {|wine| if wine[:type] == "Pinot Noir"; pinot_noirs.push(wine[:label]) end}
  puts "\nPinot Noirs in your cellar include: #{pinot_noirs}"
end

get_pinot_noir(wine_cellar)
# ```

# Write code that:
#   - Adds a wine of your choice to the cellar
#   - Returns a random wine from the cellar
#   - Returns an array of just the white wines
#   - Returns an array listing the unique types of wine
#   - Returns an array with the all the wines that have 2-word labels
#   - Returns an array with the labels of the wines that a type of Pinot Noir