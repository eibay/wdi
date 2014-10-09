require_relative './connection'
require_relative './models'
require 'pry'

Book.all.delete_all
Child.all.delete_all

a = Book.create(name: "Good morning", availability: true)
b = Book.create(name: "World Wide", availability: true)
c = Book.create(name: "See you tomorrow", availability: true)
borris = Child.create({name: "Borris", book_id: 1})
Book.find(1).availability = false,
nonborris = Child.create({name: "Non-borris", book_id: 2})
Book.find(2).availability = false,
anotherborris = Child.create({name: "Anotherborris"})
bob = Child.create({name: "Bob"})