harry.potter@hogwarts.edu
hermione.granger@hogwarts.edu
ronald.weasley@hogwarts.edu
arthur_weasley@hogwarts.edu
arthur_weasley@ministryofmagic.gov.uk
garrick@olivanderswands.co.uk

#to create a hash:
email = {}
#to populate a hash:
email["harry"] = "harry.potter@hogwarts.edu"

# when I call the hash emails, i get the key and the value
# emails i get 
# "Harry" => harry.potter@hogwarts.edu

# if I want to change the value (and keep the key) I just type it all over again with the new value tho.
#it just overwrites what's currently there: 
# emails[harry] = harry.potterman@hogwarts.edu  

#Zoo Hash
zoo = {
	"Leo" => "lion", 
	"Lizzy" => "lizard", 
	"Mike" => "monkey", 
	"Sam" => "snake", 
	"Harold" => "hippo", 
	"Mary" => "monkey"
}

zoo["Leo"]

zoo.key("monkey")

zoo.delete("Leo")

zoo

