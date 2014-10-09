require 'date'
require_relative './connection'
require_relative './models'

Book.delete_all
Child.delete_all
Borrowedbook.delete_all

borrowed_book = Book.create(name: "Go Dog Go!")
borrowed_book_2 = Book.create(name: "Go Dog Go, Part 2")
borrowed_book_3 = Book.create(name: "The Hunger Games")
borrowed_book_4 = Book.create(name: "The Hardy Boys")


jeff = Child.create(name: "Jeff")
ray = Child.create(name: "Ray")
sean = Child.create(name: "Sean")


Borrowedbook.create({child_id: jeff["id"], book_id: borrowed_book.id})
Borrowedbook.create({child_id: ray["id"], book_id: borrowed_book_2.id})
Borrowedbook.create({child_id: sean["id"], book_id: borrowed_book_3.id})

