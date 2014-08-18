#this program/server was for us to explore ways to add the search box path
# to our server.rb program

path = "/the_forest?animal=monkey&food=bananas"

goal = to get to this:

{path: "the_forest",
query_params: {
                animal: "monkeys"
                food: "bananas"
                }

}

# step 1 to get "the forest"

path.split("?")
=> [
    [0] "/the_forest",
    [1] "animal=monkey&food=bananas"
]

#step 2 to get "the forest"
split_path_1 = split_path[0]

#Step 1 + Step 2 gives us => "the_forest"

# step 2 ALTERNATE to get "the forest" using .slice
split_path = path.split("?")
split_path_1 = split_path[0]
split_path_2 = split_path[1]

clean_path_1 = split_path_1.slice!(0)
#this returns the value that I took off the '/'

#now when I call split_path_1
#it returns its updated value "the_forest" (value is updated because of the '!' on the end of slice)

#BEST WAY - we could also do this all in one step:
       
path.split("?")[0].split("/")[1]  

#gives us => "the_forest"

# we'll assign it to a variable so we can recall it later
# forest = path.split("?")[0].split("/")[1] 


# //////////////////////////////////////////////////////////////////////


# step 1 to break down "animal=monkey&food=bananas" knowing that these individual
#values will populate a new hash


path = "/the_forest?animal=monkey&food=bananas"

11] Pry(main)> paramkey1 = path.split('?')[1].split('&')[0].split('=')[0]                                          
"animal"

# here's how it breaks down step by step:

            # [23] Pry(main)> path = "/the_forest?animal=monkey&food=bananas"         

            # [24] Pry(main)> path.split("?")                                                    
            # [
            #     [0] "/the_forest",
            #     [1] "animal=monkey&food=bananas"
            # ]
            
      # NOW WE FOCUS ON THE CONTENT IN INDEX [1]
            # [25] Pry(main)> path.split("?")[1].split("&")                                      
            # [
            #     [0] "animal=monkey",
            #     [1] "food=bananas"
            # ]
      # NOW WE FOCUS ON THE CONTENT IN INDEX [0]     
            # [26] Pry(main)> path.split("?")[1].split("&")[0].split("=")                        
            # [
            #     [0] "animal",
            #     [1] "monkey"
            # ]
      # NOW WE PULL THE CONTENT IN INDEX [0] 
            # [27] Pry(main)> path.split("?")[1].split("&")[0].split("=")[0]                     
            # "animal"


[12] Pry(main)> paramval1 = path.split('?')[1].split('&')[0].split('=')[1]                                          
"monkeys"
[13] Pry(main)> paramkey2 = path.split('?')[1].split('&')[1].split('=')[0]                                          
"food"
[14] Pry(main)> paramval2 = path.split('?')[1].split('&')[1].split('=')[0]                                          
"bananas"


paramkey1 => "animal"
paramkey1.to_sym

paramval1 => "monkeys"

paramkey2 => "food"

paramval2 => "bananas"


# //////////////////////////////////////////////////////////////////////


Create a hash structure to hold all this info

monkey_info_hash = {}

monkey_info_hash = {path: forest,
                    query_params: {
                                    paramkey1.to_sym paramval1
                                    paramkey2.to_sym paramval2
                                    }

                    }




