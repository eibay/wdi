require_relative "./connection"
require "pry"

Borrower.delete_all
Book.delete_all


jimmy = Borrower.create({name: "Jimmy O'Dell"})
bobby = Borrower.create({name: "Bobby McMurtry"})
squirt = Borrower.create({name: "Squirt Palmer"})
ox = Borrower.create({name: "Oscar Falanges"})
georgy = Borrower.create({name: "George Schnabel"})

superfudge = Book.create({title: "Superfudge", borrowed: true, borrower_id: bobby.id})
tales = Book.create({title: "Tales of a Fourth Grade Nothing", borrowed: true, borrower_id: squirt.id})
hobbit = Book.create({title: "The Hobbit", borrowed: true, borrower_id: georgy.id})
margaret = Book.create({title: "Are You There, God?  It's Me, Margaret", borrowed: false})