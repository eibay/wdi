require 'pry'
require 'active_record'
require_relative 'connection'
require_relative 'models'


Child.delete_all
Book.delete_all
Loan.delete_all

mindy = Child.create({name: "Mindy"})
minty = Child.create({name: "Minty"})
minx = Child.create({name: "Minx"})

tale = Book.create({title: "The Tales of Whatever"})
autobio = Book.create({title: "Whoever's Autobio"})
telenovella = Book.create({title: "This ol Telenovella"})

Loan.create({child_id: mindy.id, book_id: tale.id})
Loan.create({child_id: minty.id, book_id: autobio.id})
Loan.create({child_id: minx.id, book_id: telenovella.id})