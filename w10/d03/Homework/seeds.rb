require_relative 'connection'
require_relative 'classes'

Child.delete_all
Book.delete_all
BorrowedBook.delete_all

Rapunzel = Child.create(name: "Rapunzel")
Gretel = Child.create(name: "Gretel")
Hansel = Child.create(name: "Hansel")
Bozo = Child.create(name: "Bozo")
Humpty_dumpty = Child.create(name: "Humpty Dumpty")
Goldilocks = Child.create(name: "Goldilocks")

Alice = Book.create(name: "Alice in Wonderland")
Pigs = Book.create(name: "Three Little Pigs")
Tortoise = Book.create(name: "Tortoise and the Hare")
Red = Book.create(name: "Little Red Ridinghood")
Babar = Book.create(name: "Babar")

a = BorrowedBook.create(child_id: 1, book_id: 1)
b = BorrowedBook.create(child_id: 1, book_id: 2)
c = BorrowedBook.create(child_id: 2, book_id: 3)
d = BorrowedBook.create(child_id: 4, book_id: 5)
