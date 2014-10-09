require 'date'
require_relative './db/connection'
require_relative './lib/book.rb'
require_relative './lib/user.rb'

Book.delete_all
User.delete_all

win_friends = Book.create(name: "How to Win Friends and Influence People")
potter = Book.create(name: "Harry Potter and the Philosopher's Stone")
history = Book.create(name: "A People's History of the United States")
time = Book.create(name: "A Brief History of Time")

nas = User.create(name: "Nastassia", book_id: time.id, borrow_date: Time.now)
dave = User.create(name: "David", book_id: history.id, borrow_date: Time.now)
ari = User.create(name: "Ariana", book_id: potter.id, borrow_date: Time.now)
