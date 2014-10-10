require 'date'
require_relative './db/connection'
require_relative './lib/book'
require_relative './lib/borrowed_book'
require_relative './lib/child'

Book.delete_all
Borrowedbook.delete_all
Child.delete_all

Book.create({title: "Maze Runner", borrowed: true})
Book.create({title: "Contagion", borrowed: false})
Book.create({title: "Kama Sutra", borrowed: false})

Child.create({name: "Peter"})
Child.create({name: "Paul"})
Child.create({name: "Mary"})

Borrowedbook.create({book_id: 1, child_id: 2})
