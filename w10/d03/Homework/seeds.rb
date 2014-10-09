ca = Parton.create name: "Clayton"
cw = Patron.create name: "Cheryl"
ak = Patron.create name: "Amanda"
nd = Patron.create name: "Nick"

Book.create name: "Locus Solus", patron_id: nd.id 
Book.create name: "The Recognitions", patron_id: ca.id 
Book.create name: "Super Sad True Love story", patron_id: cw.id 
Book.create name: "The Last Samurai", patron_id: nil 
Book.create name: "October", patron_id: ak.id 