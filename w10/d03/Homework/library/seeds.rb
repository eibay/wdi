require 'date'
require_relative './connection'
require_relative './models'

Borrow.delete_all
People.delete_all
Book.delete_all


gone_girl = Book.create(name: "Gone Girl")
life_pi = Book.create(name: "Life of Pie")
 great_expectations= Book.create(name: "Great Expectations")

tejal = Client.create(name: "Tejal", phone_number 4167439500)

tejal_borrowed = Borrow.create({
  title: "PJ's Wedding", 
  borrowed_date: Date.new(2014,09,01),
  person_id: tejal.id,
  book_id: life_pi.id,
})

