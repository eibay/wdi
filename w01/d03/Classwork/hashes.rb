

emails = {}

# emails[Key] = Value

emails["Harry"] = "harry.potter@hogwarts.edu"
emails["Arthur"] = "arthur_weasley@ministryofmagic.gov.uk"
emails["Hermione"] = "hermione.granger@hogwarts.edu"
emails["Garrick"] = "garrick@olivanderswands.co.uk"

#oops! we made a mistake in harry's email
#let's change the value
emails["Harry"] = "harry_potter@hogwarts.edu"

#let's recall the value"
emails["Harry"]

# let's look up the key
emails.key("harry_potter@hogwarts.edu")

# harry is misbehaving, he's expelled!
emails.remove("Harry")



zoo = {}

zoo[:aardvark] = []
