
#This is Neel's class on Adding to Hashes, and Using Arrays as Hash Values


# [2] pry(main)> person = {
# [2] pry(main)*   name: "Neel"
# [2] pry(main)* }  
# {
#     :name => "Neel"
# }
# [3] pry(main)> "name".to_sym
# :name
# [4] pry(main)> fav_artists = {Radiohead: ["Ok, Computer", "In Rainbows"]}
# {
#     :Radiohead => [
#         [0] "Ok, Computer",
#         [1] "In Rainbows"
#     ]
# }
# [5] pry(main)> fav_artists[:Beatles]  = []
# []
# [6] pry(main)> fav_artists
# {
#     :Radiohead => [
#         [0] "Ok, Computer",
#         [1] "In Rainbows"
#     ],
#       :Beatles => []
# }
# [7] pry(main)> fav_artists[:Beatles]
# []
# ** TO ADD NEW ALBUMS TO THE VALUES ARRAY OF BEATLES **

#[8] pry(main)> fav_artists[:Beatles].push("The White Album")
# [
#     [0] "The White Album"
# ]
# ** COULD HAVE ALSO DONE THIS: BUT IF YOU'D ALREADY PUT A VALUE IN THE HASH, 
#THIS WOULD DELETE AND REPLACE THAT ONE. BETTER TO USE PUSH, 
#IT APPENDS THE CURRENT ARRAY TO INCLUDE THIS VALUE WITHOUT DELETING WHAT IS ALREADY THERE.
#           "fav_artists[:Beatles] = ["The White Album"]

# [9] pry(main)> fav_artists
# {
#     :Radiohead => [
#         [0] "Ok, Computer",
#         [1] "In Rainbows"
#     ],
#       :Beatles => [
#         [0] "The White Album"
#     ]
# }
# [10] pry(main)> fav_artists[:Beatles]
# [
#     [0] "The White Album"
# ]
# [11] pry(main)> fav_artists[:Beatles].push("Sgt Peppers")
# [
#     [0] "The White Album",
#     [1] "Sgt Peppers"
# ]
# [12] pry(main)> fav_artists[:Beatles]
# [
#     [0] "The White Album",
#     [1] "Sgt Peppers"
# ]
# [13] pry(main)> fav_artists[:Beatles][1] #THIS IS HOW YOU RETRIEVE THE ARRAY ITEM AT THIS INDEX POSITION
#Pry returnS => "Sgt Peppers" 

# [14] pry(main)> fav_artists[:Beatles]
# [
#     [0] "The White Album",
#     [1] "Sgt Peppers"
# ]
# [15] pry(main)> fav_artists[:Beatles].push("Abbey Road")
# [
#     [0] "The White Album",
#     [1] "Sgt Peppers",
#     [2] "Abbey Road"
# ]
# [16] pry(main)> fav_artists
# {
#     :Radiohead => [
#         [0] "Ok, Computer",
#         [1] "In Rainbows"
#     ],
#       :Beatles => [
#         [0] "The White Album",
#         [1] "Sgt Peppers",
#         [2] "Abbey Road"
#     ]
# }
# [17] pry(main)> fav_artists[:Beatles].push("Revolver", "HELP")
# [
#     [0] "The White Album",
#     [1] "Sgt Peppers",
#     [2] "Abbey Road",
#     [3] "Revolver",
#     [4] "HELP"
# ]
# [18] pry(main)>
