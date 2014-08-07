

emails = {}
emails["Harry"]="harry.potter@hogwarts.edu"
emails["Arthur"]="arthur_weasley@ministryofmagic.gov.uk"
emails["Ronalf"]="ronalf.weaslet@ministryofmagic.gov.uk"

emails.key("harry_potter@hogwarts.edu")

zoo = {}
zoo["Tejal"]="Lion"
zoo["Sonny"]="Cobra"
zoo["Jessica"]="Dog"
zoo["Tina"]="Cat"
zoo["Tracy"]="Lion"



puts zoo.key("Lion")
puts zoo["Sonny"]
zoo.delete("Jessica")

puts zoo