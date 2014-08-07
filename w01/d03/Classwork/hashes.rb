# harry.potter@hogwarts.edu
# hermione.granger@hogwarts.edu
# ronald.weasley@hogwarts.edu
# arthur_weasley@ministryofmagic.gov.uk
# garrick@olivanderswands.co.uk

# emails = {}

# emails["Harry"] = "harry.potter@hogwarts.edu"
# emails["Arthur"] = "arthur_weasley@ministryofmagic.gov.uk"
# emails["Garrick"] = "garrick@olivanderswands.co.uk"

# zoo = {}
# zoo["Bob"] = "Penguin"
# zoo["Stripes"] = "Zebra"
# zoo["Vitamin C"] = "Orangutan"
# zoo["Bilbo Baggins"] = "Monkey"
# zoo["Henrietta"] = "Hippo"
# zoo
# zoo["Bob"]
# zoo.key("Zebra")
# zoo["Vitamin C"]
# zoo.key("Monkey")
# zoo["Henrietta"]


zoo = {}
zoo[:lion] = ["Simba", "Nala", "Mufasa"]
zoo[:zebra] = ["Stripes", "Zorse", "Zonkey"]
zoo[:monkey] = ["Jack", "Bob", "Oliver Twist"]

puts zoo
puts zoo[:lion][2]
puts zoo[:zebra][0]
puts zoo[:monkey][1]

zoo[:lion].push("Scar")
puts zoo[:lion]