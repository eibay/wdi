require 'pry'
require_relative './lib/connection'
require_relative './lib/child'
require_relative './lib/book'
require_relative './lib/status'

Child.delete_all
Book.delete_all
Status.delete_all

child = Child.create(name: "Cara")

book = Book.create(title: "Charlotte's Web")
book2 = Book.create(title: "A Tale of Two Cities")
book3 = Book.create(title: "Of Mice and Men")

Status.create({child_id: child.id, book_id: book.id})