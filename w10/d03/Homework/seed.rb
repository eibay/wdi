require 'date'
require_relative './connection'
require_relative './models'

Book.delete_all
BorrowedBook.delete_all
Children.delete_all

fiction = Book.create(name: "fiction")

roger = Child.create(name: "roger")

rogers_borrowed_book = BorrowedBook.create({
  child_id: roger.id,
  book_id: fiction.id
})