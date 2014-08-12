menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
order = ["Soda", "Kale Salad", "Fries"]

total_completion_time = 0
order_index = 0 

while order_index < order.length 
	item = order[order_index]
	item_complete_time = menu[item]
	total_complete_time += item_complete_time

puts total_complete_time

order_index += 1
end
puts total_complete_time

### fav_Artists, hashes continued

[4] pry(main)> fav_artists = {Radiohead: ["Ok, Computer", "In Rainbows"] }                                    
=> {:Radiohead=>["Ok, Computer", "In Rainbows"]}
[5] pry(main)> fav_artists[:"The Beatles"] = []                                                               
=> []
[6] pry(main)> fav_artists                                                                                    
=> {:Radiohead=>["Ok, Computer", "In Rainbows"], :"The Beatles"=>[]}
[7] pry(main)> fav_artists[:"The Beatles"]                                                                    
=> []
[8] pry(main)> fav_artists[:"The Beatles"].push("The White Album")                                            
=> ["The White Album"]
[9] pry(main)> fav_artists                                                                                    
=> {:Radiohead=>["Ok, Computer", "In Rainbows"], :"The Beatles"=>["The White Album"]}
[10] pry(main)>                                                                                               
[11] pry(main)> fav_artists[:"The Beatles"].push("Sgt. Peppers")                                              
=> ["The White Album", "Sgt. Peppers"]
[12] pry(main)> fav_artists[:"The Beatles"][1]                                                                
=> "Sgt. Peppers"