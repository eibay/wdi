require_relative './connection'
require_relative './models'

Book.delete_all
Child.delete_all
Borrowedbook.delete_all

rufus = Child.create(name: "Rufus")
billy = Child.create(name: "Billy")
pippi = Child.create(name: "Pippi")
tommy = Child.create(name: "Tommy")
latisha = Child.create(name: "Latisha")
jose = Child.create(name: "Jose")
minnie = Child.create(name: "Minnie")
darryl = Child.create(name: "Darryl")
xana = Child.create(name: "Xana")
maria = Child.create(name: "Maria")
david = Child.create(name: "David")
sally = Child.create(name: "Sally")

book1 = Book.create(title: "Charlottes Web")
book2 = Book.create(title: "Pippi Longstocking")
book3 = Book.create(title: "A Wrinkle in Time")
book4 = Book.create(title: "The Chronicles of Narna")
book5 = Book.create(title: "Madeline")
book6 = Book.create(title: "Everybody Poops")
book7 = Book.create(title: "Hello Book")
book8 = Book.create(title: "She Sells Seashells")
book9 = Book.create(title: "The Cat in the Hat")
book10 = Book.create(title: "Green Eggs and Ham")
book11 = Book.create(title: "The Night before Christmas")
book12 = Book.create(title: "Crackers and Barrels")

borrowed1 = Borrowedbook.create(child_id: 1, book_id: 4)
borrowed1 = Borrowedbook.create(child_id: 2, book_id: 3)
borrowed1 = Borrowedbook.create(child_id: 3, book_id: 2)
borrowed1 = Borrowedbook.create(child_id: 4, book_id: 1)
borrowed1 = Borrowedbook.create(child_id: 4, book_id: 5)
borrowed1 = Borrowedbook.create(child_id: 4, book_id: 6)
