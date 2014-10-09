require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'active_record'

# require_relative './connection_and_models'
require_relative './server_library'

Book.all.delete_all
Borrowedbook.all.delete_all
Child.all.delete_all
#

borrowed = Book.create({name: "The Borrowed"})
unborrowed = Book.create({name: "The Unborrowed"})
another_borrowed = Book.create({name: "Another Borrowed"})
also_borrowed = Book.create({name: "Also Borrowed"})
notborrowed = Book.create({name: "Not Borrowed"})

borris = Child.create({name: "Borris"})
nonborris = Child.create({name: "Non-borris"})
anotherborris = Child.create({name: "Anotherborris"})
bob = Child.create({name: "Bob"})

Borrowedbook.create({child_id: borris.id, book_id: borrowed.id})
Borrowedbook.create({child_id: anotherborris.id, book_id: another_borrowed.id})
Borrowedbook.create({child_id: borris.id, book_id: also_borrowed.id})
