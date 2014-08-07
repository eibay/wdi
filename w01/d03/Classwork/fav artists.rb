
fav_artists = {Jay_Z: ["blueprint", "black album"]}

fav_artists [:Beatles] = ["abby_road"]

puts fav_artists

# to add an album to an array (can add multiple at a time)

fav_artists[:Beatles].push("The white album", "Help")

puts fav_artists

#to get the album "the white album"

puts fav_artists [:Beatles][1]