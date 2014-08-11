### Wine Cellar

# - Here is an array containing some wines

# ```ruby
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

# ```

# Write code that:
#   - Adds a wine of your choice to the cellar
# wine_cellar.push({:label => "Rutherford Hill", :type => "Chardonnay", :color => "white"})
#   - Returns a random wine from the cellar
# puts wine_cellar.sample
#   - Returns an array of just the white wines
# i = 0

# while i < wine_cellar.length
#   wine_cellar.each { |wine|
#   if wine_cellar[i].value?("white")
#     puts wine_cellar[i]
#   end

#   i += 1
#   }
# end    b n nhnn 
#   - Returns an array listing the unique types of wine
# i = 0

# while i < wine_cellar.length
#   wine_cellar.each { |wine|
#   if wine_cellar[i].value?("white")
#     puts wine_cellar[i]
#   end

#   i += 1
#   }
# end
#   - Returns an array with the all the wines that have 2-word labels
i = 0

# while i < wine_cellar.length
#   wine_cellar.each { |wine|
#   if wine_cellar[i][:label].include?(" ")
#     puts wine_cellar[i]
#   end
#     i += 1
#   }
# end
#   - Returns an array with the labels of the wines that a type of Pinot Noir
while i < wine_cellar.length
  wine_cellar.each { |wine|
  if wine_cellar[i][:label]　== "Pinot Noir"
    puts wine_cellar[i]
  end
    i += 1
  }
end
