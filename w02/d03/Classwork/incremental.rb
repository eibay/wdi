  a = [1, 2, 3]
  b = [4, 3, 2, 1]
    i = 0 # set incremental variable to zero 
    while i < a.length do 
        a[i].times { print " oh" }
        i = 0   
        while i < b.length do 
            b[i].times { print " yeah" } 
            i += 1 
        end 
        i += 1 # increment the incremental variable 
        print "!\n" 
    end 