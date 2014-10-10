require 'date'
require_relative './connection'
require_relative './models'

Book.delete_all
User.delete_all
Borrowed_Book.delete_all

thin_Air = Book.create({title: "Into Thin Air", author: "Jon Krakauer"})
under_heaven = Book.create({title: "Under The Banner of Heaven", author: "Jon Krakauer"})

amy = User.create({name: "Amy Williamson", email: "awilliamson@gmail.com"})
jill = User.create({name: "Bari Smith", email: "bsmith@gmail.com"})

Borrowed_Book.create({title: "Under The Banner of Heaven", author: "Jon Krakauer", borrowed_date: Date.now, book_id: thin_air.id, user_id: amy.id})

