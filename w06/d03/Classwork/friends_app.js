#!/usr/local/bin/node 

actors_array = ["Jennifer Aniston", "Courteney Cox", "Lisa Kudrow", "Matt LeBlanc", "Matthew Perry", "David Schwimmer", "James Michael Tyler", "Elliott Gould", "Christina Pickles", "Paul Rudd"]

floating_point = Math.random() * actors_array.length; 
index = Math.floor(floating_point); 

console.log(actors_array[index]); 